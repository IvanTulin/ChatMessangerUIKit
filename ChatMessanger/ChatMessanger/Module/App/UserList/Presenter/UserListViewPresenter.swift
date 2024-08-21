//
//  UserListViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

protocol UserListViewPresenterProtocol: AnyObject {
    init(view: UserListViewProtocol)
    var users: [ChatUser] { get set }
}

final class UserListViewPresenter: UserListViewPresenterProtocol {
    weak var view: UserListViewProtocol?
    var users: [ChatUser]
    
    init(view: UserListViewProtocol) {
        self.view = view
        self.users = ChatUser.mockData()
    }
    
}
