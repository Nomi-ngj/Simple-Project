//
//  MockUserEntity.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
@testable import Simple_Project

struct MockUserEntity{
    static let mockUser:UserViewControllerEntity = .init(id: 01, name: "Nouman Gul Junejo", username: "Nomi-ngj", email: "Noumanguljunejo@gmail.com", address: .init(street: "none", suite: "123", city: "Karachi", zipcode: "0000", geo: .init(lat: "11.23333", lng: "23.34543")), phone: "+923458942580", website: "none", company: .init(name: "NGiDeveloper", catchPhrase: "Remote", bs: "IOS Developer"))
}
