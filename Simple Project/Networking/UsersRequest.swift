//
//  UsersRequest.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation
import SpiderWebService

struct UsersRequest: Request {
    typealias RemoteModel = [UserViewControllerEntity]

    var url: URL? = "https://jsonplaceholder.typicode.com/users"
    var method: HTTPMethod = .get
    var header: [String: String] = [:]
    var body: Data? = nil
}
