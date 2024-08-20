//
//  SceneDelegate.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(createWindowManager(notification: )), name: .windowManager, object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let authView = Builder.getAuthView()
        let regView = Builder.getRegistrationView()
        window?.rootViewController = authView
        window?.makeKeyAndVisible()
        
    }

    @objc
    private func createWindowManager(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let state = userInfo[String.state] as? WindowManager else { return }
        
        switch state {
        case .app:
            print("")
        case .auth:
            window?.rootViewController = Builder.getAuthView()
        case .registration:
            window?.rootViewController = Builder.getRegistrationView()
        }
        
    }
    

}

