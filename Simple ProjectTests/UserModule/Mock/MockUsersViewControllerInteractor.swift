//
//  MockUsersViewControllerInteractor.swift
//  Simple ProjectTests
//
//  Created by Nouman Gul Junejo on 01/05/2023.
//

import Foundation
@testable import Simple_Project
import SpiderWebService

class MockUsersViewControllerInteractor:UsersViewControllerInteracting{
    var requestFetchUser: UsersRequest = .init(url: "https://jsonplaceholder.typicode.com/users")
    
    
    var user:UserViewControllerEntity?
    
    var fetchUsersRequestSuccessWasCalled = false
    var fetchUsersRequestFailedWasCalled = false
    
    func fetchUsersRequest() async throws -> [UserViewControllerEntity] {
        
        if let user = user {
            fetchUsersRequestSuccessWasCalled = true
            return [user]
        } else {
            fetchUsersRequestFailedWasCalled = true
            throw NetworkError.httpResponseFailureStatusCode
        }
    }
}
