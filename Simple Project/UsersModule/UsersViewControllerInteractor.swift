//
//  UsersViewControllerInteractor.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation
import SpiderWebService

class UsersViewControllerInteractor:UsersViewControllerInteracting{
    var requestFetchUser: UsersRequest
    
    init(requestFetchUser: UsersRequest = UsersRequest()) {
        self.requestFetchUser = requestFetchUser
    }
    
    func fetchUsersRequest() async throws -> [UserViewControllerEntity] {
        let request = await requestFetchUser.send()
        switch request {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}
