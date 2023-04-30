//
//  UsersViewControllerInteractor.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import Foundation

class UsersViewControllerInteractor:UsersViewControllerInteracting{
    func fetchUsersRequest() async throws -> [UserViewControllerEntity] {
        let request = await UsersRequest().send()
        switch request {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        }
    }
}
