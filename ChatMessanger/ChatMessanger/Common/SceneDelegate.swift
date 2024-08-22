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
        window?.rootViewController = FirebaseManager.shared.isLogin() ? Builder.getTabBarView() : Builder.getAuthView()
        window?.makeKeyAndVisible()
        
    }

    @objc
    private func createWindowManager(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let state = userInfo[String.state] as? WindowManager else { return }
        
        switch state {
        case .app:
            window?.rootViewController = Builder.getTabBarView()
        case .auth:
            window?.rootViewController = Builder.getAuthView()
        case .registration:
            window?.rootViewController = Builder.getRegistrationView()
        }
        
    }
    

}

