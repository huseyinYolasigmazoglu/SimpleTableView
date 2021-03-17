//
//  VirginMoneyTests.swift
//  VirginMoneyTests
//
//  Created by Huseyin Yolasigmazoglu on 16/03/2021.
//

import XCTest
@testable import VirginMoney

class VirginMoneyTests: XCTestCase {
    
    func testVirginMoneyTests_WhenRealWebServiceCalled_ShouldMoreThanZero()  {
        
        let expectation = self.expectation(description: "WaitForWebService")
        
        let test = CommentService(Webservice())
        
        var commentResultCount : Int = 0
        
        test.getAllComments(completion: { result in
            
            switch result {
            case .success(let comments):
                commentResultCount = comments.count
            case .failure( _):
                commentResultCount = 0
            }
            expectation.fulfill()
        }
        )
        
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssertTrue(commentResultCount>0)
    }
    
    
    func testVirginMoneyTests_WhenRealMocServiceCalled_ShouldMoreThanZero()  {
        
        let expectation = self.expectation(description: "WaitForWebService")
        
        let test = CommentService(MockWebservice())
        
        var commentResultCount : Int = 0
        
        test.getAllComments(completion: { result in
            
            switch result {
            case .success(let comments):
                commentResultCount = comments.count
            case .failure( _):
                commentResultCount = 0
            }
            expectation.fulfill()
        }
        )
        
        waitForExpectations(timeout: 2, handler: nil)
        print("Heyy \(commentResultCount)")
        XCTAssertTrue(commentResultCount>0)
        
    }
    
    func testVirginMoneyTests_WhenCommentListViewModelInit_ShouldReturnFirstLineOfTheComment()  {
        
        let expectation = self.expectation(description: "WaitForWebService")
        
        let test = CommentService(MockWebservice())
        
        test.getAllComments(completion: { result in
            expectation.fulfill()
        }
        )
        
        let commentListVM : ListViewModel? = CommentListViewModel(test)
        waitForExpectations(timeout: 2, handler: nil)
        
        
        XCTAssertEqual(commentListVM?.commentIndex(0)?.simpleFirtLineComment(), "FIRST_LINE")
        
    }
}
