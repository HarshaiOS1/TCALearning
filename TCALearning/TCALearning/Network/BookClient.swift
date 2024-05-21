//
//  BookClient.swift
//  TCALearning
//
//  Created by Krishnappa, Harsha on 21/05/2024.
//

import Foundation
import ComposableArchitecture

struct BookClient {
    var fetchCharacters: ([String]) async throws -> [Character]?
    
}

extension BookClient: DependencyKey {
    static var liveValue: BookClient = Self(
        fetchCharacters: { urls in
            let chars: [Character?] = try await arrayRequest(for: urls)
            return chars.compactMap({$0})
        })
    
    private static func arrayRequest<T: Codable>(for links: [String]) async throws -> [T?] {
        //withThrowingTaskGroup : PTR : Nice function
        let results: [T?] = try await withThrowingTaskGroup(of: T?.self) { group in
            for link in links {
                group.addTask {
                    do {
                        guard let linkURL = URL(string: link) else { return nil }
                        let (data, _) = try await URLSession.shared.data(from: linkURL)
                        let model = try JSONDecoder().decode(T.self, from: data)
                        return model
                    } catch {
                        print("Error fetching or decoding data from \(link): \(error)")
                        return nil
                    }
                }
            }
            return try await group.reduce(into: [T?]()) { models, model in
                models.append(model)
            }
        }
        return results
    }
}


extension DependencyValues {
    var bookClient: BookClient {
        get { self[BookClient.self] }
        set { self[BookClient.self] = newValue }
    }
}

