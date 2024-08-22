//
//  MessangerViewPresenter.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation
import MessageKit

protocol MessangerViewPresenterProtocol: AnyObject {
    var title: String { get set }
    var selfSender: Sender { get set }
    var messages: [Message] { get set }
}

final class MessangerViewPresenter: MessangerViewPresenterProtocol {
    var title: String
    var messages: [Message]
    
    weak var view: MessangerViewProtocol?
    
    lazy var selfSender = Sender(senderId: "1", displayName: "Ivan")
    private lazy var otherSender = Sender(senderId: otherId, displayName: "Ivan")
    private var conversationId: String
    private var otherId: String
    
    
    init(view: MessangerViewProtocol, conversationId: String, otherId: String, name: String) {
        self.view = view
        self.conversationId = conversationId
        self.otherId = otherId
        title = name
        messages = Message.mockData()
    }
}



