//
//  UserCompleteDetailsViewControllerPresenterTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 02/05/2023.
//

import XCTest
@testable import Simple_Project

final class UserCompleteDetailsViewControllerPresenterTest: XCTestCase {
    
    var sut: UserCompleteDetailsViewControllerPresenting!
    var mockView: MockUserCompleteDetailsViewController!
    
    override func setUp() {
        super.setUp()
        mockView = MockUserCompleteDetailsViewController()
        sut = UserCompleteDetailsViewControllerPresenter(mockView, MockUserEntity.mockUser)
    }
    
    override func tearDown() {
        sut = nil
        mockView = nil
        super.tearDown()
    }
    
    func testViewDidLoadSetupUI() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.setupUIWasCalled)
    }

    func testViewDidLoadReload() {
        sut.viewDidLoad()
        XCTAssertTrue(mockView.reloadDataWasCalled)
    }
}
