//
//  TabBarView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

class TabBarView: UITabBarController {
    // MARK: - Visual Components
    
    
    
    // MARK: - Puplic Properties
    
    var presenter: TabBarViewPresenter!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

extension TabBarView: TabBarViewProtocol {
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
    }
    
}
