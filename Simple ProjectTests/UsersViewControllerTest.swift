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

    override func setUp() {
        super.setUp()
        
        self.sut = UsersViewControllerRouter.make() as? UsersViewController
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
    
//    func testTableViewCellHasReuseIdentifier() {
//        sut.viewDidLoad()
//        let indexPath = IndexPath(row: 0, section: 0)
//        let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath) as? ViewControllerCell
//        let actualReuseIdentifer = cell?.reuseIdentifier
//        let expectedReuseIdentifier = "ViewControllerCell"
//        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
//    }
    
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
}
