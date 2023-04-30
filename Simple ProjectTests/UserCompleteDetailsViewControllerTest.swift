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
        
        self.sut = UserCompleteDetailsViewControllerRouter.make(user: .init(id: 01, name: "Nouman Gul Junejo", username: "Nomi-NGJ", email: "Noumanguljunejo@gmail.com", address: .init(street: "none", suite: "123", city: "Karachi", zipcode: "0000", geo: .init(lat: "11.23333", lng: "23.34543")), phone: "+923458942580", website: "none", company: .init(name: "NGiDeveloper", catchPhrase: "Remote", bs: "IOS Developer"))) as? UserCompleteDetailsViewController
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
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
//        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
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

