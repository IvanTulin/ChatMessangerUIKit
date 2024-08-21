//
//  TabBarViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

protocol TabBarViewPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
}


final class TabBarViewPresenter: TabBarViewPresenterProtocol {
    weak var view: TabBarViewProtocol?
    
    init(view: TabBarViewProtocol) {
        self.view = view
    }
    
}
