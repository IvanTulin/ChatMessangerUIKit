//
//  UserListViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

protocol UserListViewPresenterProtocol: AnyObject {
    init(view: UserListViewProtocol)
}

final class UserListViewPresenter: UserListViewPresenterProtocol {
    weak var view: UserListViewProtocol?
    
    init(view: UserListViewProtocol) {
        self.view = view
    }
    
}
