//
//  UserViewControllerEntityTest.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import XCTest
@testable import Simple_Project

final class UserViewControllerEntityTest: XCTestCase {
    var sut:UserViewControllerEntity!
    
    func testUserInitialization() {
        sut = MockUserEntity.mockUser
        XCTAssertEqual(sut.id, 01)
        XCTAssertEqual(sut.name, "Nouman Gul Junejo")
        XCTAssertEqual(sut.username, "Nomi-ngj")
        XCTAssertEqual(sut.email, "Noumanguljunejo@gmail.com")
        XCTAssertEqual(sut.phone, "+923458942580")
        XCTAssertEqual(sut.website, "none")
        XCTAssertEqual(sut.address.street, "none")
        XCTAssertEqual(sut.address.suite, "123")
        XCTAssertEqual(sut.address.city, "Karachi")
        XCTAssertEqual(sut.address.zipcode, "0000")
        XCTAssertEqual(sut.address.geo.lat, "11.23333")
        XCTAssertEqual(sut.address.geo.lng, "23.34543")
        XCTAssertEqual(sut.company.name, "NGiDeveloper")
        XCTAssertEqual(sut.company.catchPhrase, "Remote")
        XCTAssertEqual(sut.company.bs, "IOS Developer")
    }
}
