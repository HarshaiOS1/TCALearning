//
//  TCALearningTests.swift
//  TCALearningTests
//
//  Created by Krishnappa, Harsha on 17/05/2024.
//

import XCTest
import ComposableArchitecture

@testable import TCALearning

final class TCALearningTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBookListAPICall() async {
        //create dummy data
        let testBooks: [Book] = [
            Book(url: "url", name: "asdadfa", isbn: nil, authors: nil, numberOfPages: nil, publisher: nil, country: nil, mediaType: nil, released: nil, characters: nil, povCharacters: nil),
            Book(url: "url 1", name: " asdadfaasdadfa", isbn: nil, authors: nil, numberOfPages: nil, publisher: nil, country: nil, mediaType: nil, released: nil, characters: nil, povCharacters: nil)
        ]
        let testBooksData = try! JSONEncoder().encode(testBooks)
        
        //create session configured to mockurlprotocol
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response,testBooksData)
        }
        //lets test reducer
        let initialState = BookListReducer.State()
        
        let testStore = TestStore.init(initialState: initialState) {
            BookListReducer()
        }
        
        await testStore.send(.fetchBooks)
        
        let scheduler = DispatchQueue.test
        await scheduler.advance(by: 5)
        
//        'receive(_:assert:file:line:)' is unavailable: Provide a key path to the case you expect to receive (like 'store.receive(\.tap)'),
        
//        await testStore.receive(.)
        
        XCTAssertNotNil(testStore.state.books)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
