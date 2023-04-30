//
//  UserViewControllerEntity.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation

// MARK: - UserModel
struct UserViewControllerEntity: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}
