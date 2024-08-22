//
//  MessangerView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import UIKit
import MessageKit
import InputBarAccessoryView /// для ввода текста в чат

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
        /// для ввода текста в чат
        messageInputBar.delegate = self
    }
    
    private func insertMessage(_ message: Message) {
        presenter.messages.append(message)
        messagesCollectionView.performBatchUpdates {
            messagesCollectionView.insertSections([presenter.messages.count - 1])
            if presenter.messages.count >= 2 {
                messagesCollectionView.reloadSections([presenter.messages.count - 2])
            }
        } completion: { [weak self] _ in
            self?.messagesCollectionView.scrollToLastItem(animated: true)
        }

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
    
    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
    /// высота для имени над сообщенем
    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
    /// высота для даты над сообщенем
    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        20
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        message.sender.senderId == presenter.selfSender.senderId ? .systemBlue : .gray
    }
    
    /// тест для имени над сообщенем
    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return  NSAttributedString(string: name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black])
    }
    
    /// тест для даты над сообщенем
    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let date = message.sentDate.formatted()
        return  NSAttributedString(string: date, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.black])
    }
    
    /// аватар отправителя сообщения
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.initials = String(message.sender.displayName.first ?? "-")
        avatarView.backgroundColor = .systemGray2
    }
}

// MARK: - MessangerView + InputBarAccessoryViewDelegate

extension MessangerView: InputBarAccessoryViewDelegate {
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let message = Message(sender: presenter.selfSender, messageId: UUID().uuidString, sentDate: Date(), kind: .text(text))
        insertMessage(message)
        inputBar.inputTextView.text = ""
    }
}
