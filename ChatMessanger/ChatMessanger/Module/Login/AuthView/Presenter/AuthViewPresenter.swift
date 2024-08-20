//
//  AuthViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

protocol AuthViewPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol)
}

final class AuthViewPresenter: AuthViewPresenterProtocol {
    weak var view: AuthViewProtocol?
    
    init(view: AuthViewProtocol) {
        self.view = view
    }
    
    
}
