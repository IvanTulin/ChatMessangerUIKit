//
//  MessageListView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit

protocol MessageListViewProtocol: AnyObject {
    
}

final class MessageListView: UIViewController {
    // MARK: - Visual Components
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.bounds, style: .insetGrouped))
    
    
    // MARK: - Puplic Properties
    
    var presenter: MessageViewPresenter!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = .locolize("tabMessages")
        
        addSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // tabBarController?.tabBar.isHidden = false
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
}

// MARK: - UserListView + MessageListViewProtocol

extension MessageListView: MessageListViewProtocol {
    
}

// MARK: - UserListView + UITableViewDelegate

extension MessageListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatItem = presenter.chatList[indexPath.row]
        
        let messageController = Builder.getMessangerView(chatItem: chatItem)
        navigationController?.pushViewController(messageController, animated: true)
        
    }
}

// MARK: - UserListView + UITableViewDataSource

extension MessageListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellItem = presenter.chatList[indexPath.row]
        
        var configCell = cell.defaultContentConfiguration()
        configCell.text = cellItem.name
        configCell.image = UIImage(systemName: "person.fill")
        configCell.secondaryText = cellItem.lastMessage.truncate(to: 80)
        cell.contentConfiguration = configCell
        
        return cell
    }
}
