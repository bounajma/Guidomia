//
//  SceneDelegate.swift
//  Guidomia
//
//  Created by Mohamed on 26/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appCoordinator = AppCoordinator()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.frame = UIScreen.main.bounds
            self.window = window
            appCoordinator.start(window: self.window)
        }
        
    }


}

