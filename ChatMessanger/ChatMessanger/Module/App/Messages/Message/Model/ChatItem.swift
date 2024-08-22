//
//  ChatItem.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

struct ChatItem {
    var id: String
    var name: String
    var otherUserId: String
    var date: Date
    var lastMessage: String
    
    static func getMockData() -> [ChatItem] {
        [
            ChatItem(id: UUID().uuidString, name: "User1", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet, consectetur adipisicing "),
            ChatItem(id: UUID().uuidString, name: "User2", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet  elit"),
            ChatItem(id: UUID().uuidString, name: "User3", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum, consectetur adipisicing elit. Lorem ipsum dolor sit amet, consectetur adipisicing"),
            ChatItem(id: UUID().uuidString, name: "User4", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet, consectetur adipisicing elit"),
            ChatItem(id: UUID().uuidString, name: "User5", otherUserId: UUID().uuidString, date: Date(), lastMessage: "Lorem ipsum dolor sit amet"),
        ]
    }
}
