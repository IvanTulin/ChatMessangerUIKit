//
//  FirebaseManager.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import Foundation
import Firebase

final class FirebaseManager {
    static let shared = FirebaseManager()
    let auth = Auth.auth()
    
    private init () {}
    
    func isLogin() -> Bool {
        auth.currentUser?.uid == nil ? false : true
    }
    
    func getUser() -> User? {
        guard let user = auth.currentUser else { return nil }
        return user
    }
    
    func signOut() {
        do {
            try auth.signOut()
            NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.app])
        } catch  {
            print(error.localizedDescription)
        }
    }
}
