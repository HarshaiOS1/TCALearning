//
//  MockURLProtocol.swift
//  TCALearningTests
//
//  Created by Krishnappa, Harsha on 23/05/2024.
//

import Foundation
import XCTest

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) -> (HTTPURLResponse, Data))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Reqeust handler unavailable")
            return
        }
        let (response, data) = handler(request)
        self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        self.client?.urlProtocol(self, didLoad: data)
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
         print("stopped loading")
    }
    
}
