//
//  RegistrationViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    init(view: RegistrationViewProtocol)
    func sendToRegist(userInfo: UserInfo)
}

final class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    weak var view: RegistrationViewProtocol?
    private let registerManager = RegistrationManager()
    private let validator = FileValidator()
    
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
    
    func sendToRegist(userInfo: UserInfo) {
        if validator.isValidate(.email, userInfo.email),
           validator.isValidate(.password, userInfo.password) {
            registerManager.createUser(userInfo: userInfo) { result in
                switch result {
                case .success(let success):
                    if success {
                        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.app])
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        } else {
            print("alert - Ошибка")
        }
        
    }
}
