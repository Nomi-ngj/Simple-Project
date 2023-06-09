//
//  UsersViewControllerTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import XCTest
@testable import Simple_Project

final class UsersViewControllerTest: XCTestCase {
    
    var sut:UsersViewController!
    var presenter: MockUsersViewControllerPresenter?
    
    override func setUp() {
        super.setUp()
        
        self.sut = UsersViewControllerRouter.make() as? UsersViewController
        presenter = MockUsersViewControllerPresenter()
        sut.presenter = presenter
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
    
    func testHasAPresenter(){
        XCTAssertNotNil(sut.presenter)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:)))
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
    
    func testRegisterUserTableViewCell() {
        sut.setupUI()
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell
        XCTAssertNotNil(cell)
    }
    
    func testRegisterUserTableViewCellConfig() {
        
        sut.setupUI()
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        let user = MockUserEntity.mockUser
        
        DispatchQueue.main.async {
            XCTAssertNoThrow(cell.config(viewModel: user))
            
            XCTAssertEqual(cell.lblUserName.text, user.username)
            XCTAssertEqual(cell.lblFullName.text, user.name)
            XCTAssertEqual(cell.lblEmail.text, user.email)
            XCTAssertEqual(cell.lblPhone.text, user.phone)
        }
    }
    
    func testTableViewSelection() {
        presenter?.users = [MockUserEntity.mockUser]
        sut.reloadData()
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        XCTAssertEqual(sut.tableView.indexPathForSelectedRow, indexPath)
    }
    
    func testViewDidLoad(){
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter!.viewDidLoadWasCalled)
    }
    
    func testViewDidLoadSuccessFetchUsers(){
        presenter?.users = [MockUserEntity.mockUser]
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter!.fetchUsersSuccessWasCalled)
    }
    
    func testViewDidLoadFailedToFetchUsers(){
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter!.fetchUsersFailedWasCalled)
    }
    
    func testTableViewDidSelectRow() {
        
        sut.tableView.delegate = sut
        
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        
        XCTAssertTrue(presenter!.didSelectWasCalled)
    }
    
    func testTableViewCellForRowAt() {
        
        let tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserTableViewCell")
        
        let cellAtIndex0: UITableViewCell = sut.tableView(tableView, cellForRowAt: .init(row: 0, section: 0))
        XCTAssertTrue(cellAtIndex0 is UserTableViewCell)
    }
}
