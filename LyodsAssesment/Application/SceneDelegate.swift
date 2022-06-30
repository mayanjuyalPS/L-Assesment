//
//  SceneDelegate.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import UIKit
import Swinject

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        _ = Assembler.sharedAssembler.resolver.resolve(NetworkClient.self)
        window = UIWindow(windowScene: windowScene)
        let controller = Assembler.sharedAssembler.resolver.resolve(UserViewController.self)!
        let nvc: UINavigationController = UINavigationController(rootViewController: controller)
        //nvc.setNavigationBarHidden(false, animated: false)
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }

}

