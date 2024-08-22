//
//  RegistrationManager.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 22.08.2024.
//

import Foundation
import Firebase

final class RegistrationManager {
    func createUser(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { [weak self] result, error in
            guard error == nil else { 
                //completion(.failure(error?.localizedDescription))
                return
            }
            guard let result else { return }
            
            result.user.sendEmailVerification()
            self?.setUserInfo(uuid: result.user.uid , userInfo: userInfo, completion: {
                completion(.success(true))
            })
        }
    }
    
    private func setUserInfo(uuid: String ,userInfo: UserInfo, completion: @escaping () -> Void) {
        let userData: [String: Any] = [
            "name": userInfo.name ?? "",
            "email": userInfo.email,
            "regDate": Date()
        ]
        
        Firestore.firestore()
            .collection(.users)
            .document(uuid)
            .setData(userData) { _ in
                completion()
            }
    }
    
}


