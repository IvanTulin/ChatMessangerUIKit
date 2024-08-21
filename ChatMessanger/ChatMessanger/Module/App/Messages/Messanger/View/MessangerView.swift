//
//  MessangerView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit
import MessageKit

protocol MessangerViewProtocol: AnyObject {
    
}

final class MessangerView: MessagesViewController {
    // MARK: - Puplic Properties
    
    var presenter: MessangerViewPresenter!

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showMessageTimestampOnSwipeLeft = true
        messagerSetup()
    }
    
    // MARK: - Private Methods
    
    private func messagerSetup() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.reloadData()
    }
    
}

// MARK: - MessangerView + MessangerViewProtocol

extension MessangerView: MessangerViewProtocol {
    
}

// MARK: - MessangerView + MessagesDataSource

extension MessangerView: MessagesDataSource {
    var currentSender: MessageKit.SenderType {
        presenter.selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        presenter.messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        presenter.messages.count
    }
    
    
}

// MARK: - MessangerView + MessagesLayoutDelegate

extension MessangerView: MessagesLayoutDelegate {
    
}

// MARK: - MessangerView + MessagesDisplayDelegate

extension MessangerView: MessagesDisplayDelegate {
    
}
