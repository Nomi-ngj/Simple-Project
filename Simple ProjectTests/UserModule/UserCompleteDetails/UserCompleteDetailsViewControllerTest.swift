//
//  UserCompleteDetailsViewControllerTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import XCTest
@testable import Simple_Project

final class UserCompleteDetailsViewControllerTest: XCTestCase {
    
    var sut:UserCompleteDetailsViewController!

    override func setUp() {
        super.setUp()
        
        self.sut = UserCompleteDetailsViewControllerRouter.make(user: MockUserEntity.mockUser) as? UserCompleteDetailsViewController
        self.sut.loadView()
        self.sut.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
        self.sut = nil
    }
    
    func testHasATableView(){
        XCTAssertNotNil(sut.tableView)
    }
    
    func testRegisterUserTableViewCell() {

        sut.setupUI()
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "UserCompleteDetailsCell") as? UserCompleteDetailsCell
        XCTAssertNotNil(cell)
    }
    
    func testRegisterUserTableViewCellConfig() {
        sut.setupUI()
        
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "UserCompleteDetailsCell") as! UserCompleteDetailsCell
        let user = MockUserEntity.mockUser
        
        DispatchQueue.main.async {
            XCTAssertNoThrow(cell.config(viewModel: user))
            XCTAssertNotNil(cell.lblUserName)
            XCTAssertNotNil(cell.lblFullName)
            XCTAssertNotNil(cell.lblEmail)
            XCTAssertNotNil(cell.lblPhone)
            XCTAssertNotNil(cell.lblAddress)
            XCTAssertNotNil(cell.lblCompany)
            XCTAssertNotNil(cell.lblDesignation)
            XCTAssertNotNil(cell.lblWebsite)
            
            XCTAssertEqual(cell.lblUserName.text, user.username)
            XCTAssertEqual(cell.lblFullName.text, user.name)
            XCTAssertEqual(cell.lblEmail.text, user.email)
            XCTAssertEqual(cell.lblPhone.text, user.phone)
            XCTAssertEqual(cell.lblAddress.text, user.address.completeAddress)
            XCTAssertEqual(cell.lblCompany.text, user.company.name)
            XCTAssertEqual(cell.lblDesignation.text, user.company.bs)
            XCTAssertEqual(cell.lblWebsite.text, user.website)
        }
    }
    
    func testHasAPresenter(){
        XCTAssertNotNil(sut.presenter)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
}

