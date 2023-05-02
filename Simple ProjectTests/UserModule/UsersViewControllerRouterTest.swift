//
//  UsersViewControllerRouterTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 02/05/2023.
//

import XCTest
@testable import Simple_Project

final class UsersViewControllerRouterTest: XCTestCase {
    var mockView: MockUsersViewController!
    var sut: UsersViewControllerRouting!
    var presenter: MockUsersViewControllerPresenter!
    
    override func setUp() {
        super.setUp()
        mockView = MockUsersViewController()
        presenter = MockUsersViewControllerPresenter()
        sut = UsersViewControllerRouter()
        
        sut.view = mockView
        presenter.view = mockView
        presenter.router = sut
        
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    func testShowUserCompleteDetailScreen(){
        let user = MockUserEntity.mockUser
        presenter.users = [user]
        presenter.didSelect(at: .init(row: 0, section: 0))
        
        XCTAssertEqual(presenter.didSelectWasCalled, true)
    }
    
}
