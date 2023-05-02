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
    
    var sut: UsersViewControllerPresenting!
    var mockView: MockUsersViewController!
    var mockRouter: MockUsersViewControllerRouter!
    var mockInteractor: MockUsersViewControllerInteractor!
    
    override func setUp() {
        super.setUp()
        mockView = MockUsersViewController()
        mockRouter = MockUsersViewControllerRouter()
        mockInteractor = MockUsersViewControllerInteractor()
        sut = UsersViewControllerPresenter()
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }
    
    // MARK: - Tests for protocol functions
    func testViewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.setupUIWasCalled)
    }
    
    func testSuccessFetchingUsers() async {
        DispatchQueue.main.async {
            Task{
                self.mockInteractor.user = MockUserEntity.mockUser
                self.sut.fetchUsers()
                XCTAssertTrue(self.mockInteractor.fetchUsersRequestSuccessWasCalled)
            }
        }
    }
    
    func testFailedToFetchUsers() {
        mockInteractor.user = nil
        sut.fetchUsers()
        
        XCTAssertFalse(mockInteractor.fetchUsersRequestFailedWasCalled)
    }
    
    func testDidSelect() {
        let indexPath = IndexPath(row: 0, section: 0)
        let user = MockUserEntity.mockUser
        sut.users = [user]
        sut.didSelect(at: indexPath)
        XCTAssertTrue(mockRouter.showUserCompleteDetailScreenWasCalled)
    }
}
