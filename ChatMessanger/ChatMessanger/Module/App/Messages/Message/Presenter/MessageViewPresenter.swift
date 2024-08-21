//
//  MessageViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

protocol MessageViewPresenterProtocol: AnyObject {
    var chatList: [ChatItem] { get set }
}

final class MessageViewPresenter: MessageViewPresenterProtocol {
    weak var view: MessageListViewProtocol?
    var chatList: [ChatItem]
    
    init(view: MessageListViewProtocol) {
        self.view = view
        self.chatList = ChatItem.getMockData()
    }
}
