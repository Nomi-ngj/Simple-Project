//
//  UsersViewControllerInteractorTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 02/05/2023.
//

import XCTest
@testable import Simple_Project

final class UsersViewControllerInteractorTest: XCTestCase {
    
    var sut: UsersViewControllerInteractor!
    var presenter: MockUsersViewControllerPresenter!
    
    
    override func setUp() {
        super.setUp()
        
        presenter = MockUsersViewControllerPresenter()
        sut = UsersViewControllerInteractor()
        
        presenter.interactor = sut
        
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }

    func testRequestFailure(){
        
        Task {
            do {
                var request = UsersRequest()
                request.url = URL(string: "https://example.com")
                sut = UsersViewControllerInteractor(requestFetchUser: request)
                let result = try await sut.fetchUsersRequest()
                XCTFail("Expected error but got result: \(result)")
            } catch {
                // Expected error occurred, test passed
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testRequestSuccess(){
        DispatchQueue.main.async {
            Task(priority: .userInitiated) {
                do {
                    let result = try await self.sut.fetchUsersRequest()
                    XCTAssertGreaterThan(result.count, 0)
                } catch {
                    // Expected error occurred, test passed
                    XCTFail("Expected result but got error: \(error)")
                }
            }
        }
       
    }
}
