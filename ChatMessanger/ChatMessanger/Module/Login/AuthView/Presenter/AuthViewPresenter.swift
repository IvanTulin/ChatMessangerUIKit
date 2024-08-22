//
//  AuthViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

protocol AuthViewPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol)
    func signIn(userInfo: UserInfo)
}

final class AuthViewPresenter: AuthViewPresenterProtocol {
    weak var view: AuthViewProtocol?
    private let authManager = AuthManager()
    private let validator = FileValidator()
    
    init(view: AuthViewProtocol) {
        self.view = view
    }
    
    func signIn(userInfo: UserInfo) {
        if validator.isValidate(.email, userInfo.email), validator.isValidate(.password, userInfo.password ) {
            authManager.authorization(userInfo: userInfo) { result in
                switch result {
                case .success(let success):
                    if success {
                        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.app])
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
        
    }
    
    
}
