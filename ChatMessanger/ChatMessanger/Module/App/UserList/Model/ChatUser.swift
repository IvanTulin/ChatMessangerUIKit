//
//  User.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 21.08.2024.
//

import Foundation

struct ChatUser {
    let id: String
    let name: String
    
    static func mockData() -> [ChatUser] {
        [
            ChatUser(id: UUID().uuidString, name: "User1"),
            ChatUser(id: UUID().uuidString, name: "User2"),
            ChatUser(id: UUID().uuidString, name: "User3"),
            ChatUser(id: UUID().uuidString, name: "User4"),
            ChatUser(id: UUID().uuidString, name: "User5"),
            ChatUser(id: UUID().uuidString, name: "User6"),
        ]
    }
}
