//
//  RegistrationViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import Foundation

protocol RegistrationViewPresenterProtocol: AnyObject {
    init(view: RegistrationViewProtocol)
}

final class RegistrationViewPresenter: RegistrationViewPresenterProtocol {
    weak var view: RegistrationViewProtocol?
    
    init(view: RegistrationViewProtocol) {
        self.view = view
    }
}
