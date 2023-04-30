//
//  SceneDelegate.swift
//  Simple Project
//
//  Created by Nouman Gul Junejo on 30/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{

    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let viewController = UsersViewController(nibName: "UsersViewController", bundle: Bundle.main)
        let navigationController =
        UINavigationController(rootViewController:
                                viewController)
        self.window?.rootViewController = navigationController
    } 
}

