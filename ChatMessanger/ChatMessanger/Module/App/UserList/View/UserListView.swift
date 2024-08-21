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
    // MARK: - Visual Components
    
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    // MARK: - Puplic Properties
    
    var presenter: UserListViewPresenterProtocol!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = .locolize("tabUsers")
        
        addSubviews() 
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
}

// MARK: - UserListView + UserListViewProtocol

extension UserListView: UserListViewProtocol {
    
}

// MARK: - UserListView + UITableViewDelegate

extension UserListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(presenter.users[indexPath.row].id)
    }
}

// MARK: - UserListView + UITableViewDataSource

extension UserListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellItem = presenter.users[indexPath.row]
        
        var configCell = cell.defaultContentConfiguration()
        configCell.text = cellItem.name
        configCell.image = UIImage(systemName: "person.circle.fill")
        cell.contentConfiguration = configCell
        
        return cell
    }
}
