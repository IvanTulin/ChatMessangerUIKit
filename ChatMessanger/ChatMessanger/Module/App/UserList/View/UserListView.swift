//
//  UserListView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit

protocol UserListViewProtocol: AnyObject {
    
}


final class UserListView: UIViewController {
    var presenter: UserListViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

extension UserListView: UserListViewProtocol {
    
}
