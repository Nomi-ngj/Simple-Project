//
//  UserViewControllerPresenterTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import XCTest
@testable import Simple_Project
import SpiderWebService

final class UserViewControllerPresenterTest: XCTestCase {
    
    var presenter: UsersViewControllerPresenting!
    var mockView: MockUsersViewController!
    var mockRouter: MockUsersViewControllerRouter!
    var mockInteractor: MockUsersViewControllerInteractor!
    
    override func setUp() {
        super.setUp()
        mockView = MockUsersViewController()
        mockRouter = MockUsersViewControllerRouter()
        mockInteractor = MockUsersViewControllerInteractor()
        presenter = UsersViewControllerPresenter()
        presenter.view = mockView
        presenter.router = mockRouter
        presenter.interactor = mockInteractor
    }
    
    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    // MARK: - Tests for protocol functions
    func testViewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(mockView.setupUIWasCalled)
    }
    
    func testSuccessFetchingUsers() {
        
        let expectation = XCTestExpectation(description: "SuccessFetchingUsers")

        DispatchQueue.global(qos: .userInitiated).async {
            self.mockInteractor.user = MockUserEntity.mockUser
            self.presenter.fetchUsers()
            expectation.fulfill()
        }
            
        // Wait for the expectation to be fulfilled, or time out after 2 seconds
        wait(for: [expectation], timeout: 2)

        XCTAssertTrue(mockInteractor.fetchUsersRequestSuccessWasCalled)
    }
    
    func testFailedToFetchUsers() {
        mockInteractor.user = nil
        presenter.fetchUsers()
        
        XCTAssertFalse(mockInteractor.fetchUsersRequestFailedWasCalled)
    }
    
    func testDidSelect() {
        let indexPath = IndexPath(row: 0, section: 0)
        let user = MockUserEntity.mockUser
        presenter.users = [user]
        presenter.didSelect(at: indexPath)
        XCTAssertTrue(mockRouter.showUserCompleteDetailScreenWasCalled)
    }
}
