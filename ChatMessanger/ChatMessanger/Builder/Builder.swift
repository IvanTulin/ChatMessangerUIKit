//
//  Builder.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

final class Builder {
    static func getAuthView() -> UIViewController {
        let view = AuthView()
        let presenter = AuthViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getRegistrationView() -> UIViewController {
        let view = RegistrationView()
        let presenter = RegistrationViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getTabBarView() -> UIViewController {
        let view = TabBarView()
        let presenter = TabBarViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
