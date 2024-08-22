//
//  AuthManager.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 22.08.2024.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    func authorization(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result , error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            
            guard let result else { return }
            
            completion(.success(true))
//            
//            if result.user.isEmailVerified {
//                completion(.success(true))
//            } else {
//                completion(.success(false))
//            }
        }
    }
}
