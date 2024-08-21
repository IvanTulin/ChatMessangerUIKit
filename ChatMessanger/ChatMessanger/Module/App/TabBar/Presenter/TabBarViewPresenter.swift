//
//  TabBarViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
}


final class TabBarViewPresenter: TabBarViewPresenterProtocol {
    weak var view: TabBarViewProtocol?
    
    init(view: TabBarViewProtocol) {
        self.view = view
        setupControllers()
    }
    
    func setupControllers() {
        let userListView = Builder.getUserListView()
        userListView.title = .locolize("tabUsers")
        userListView.tabBarItem.image = UIImage(systemName: "person.3")
        
        let messagListView = Builder.getMessageListView()
        messagListView.title = .locolize("tabMessages")
        messagListView.tabBarItem.image = UIImage(systemName: "rectangle.3.group.bubble")
        
        view?.setControllers(views: [userListView, messagListView])
    }
    
}
