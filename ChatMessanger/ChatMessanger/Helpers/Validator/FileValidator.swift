//
//  FileValidator.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 22.08.2024.
//

import Foundation

final class FileValidator {
    func isValidate(_ type: FieldType, _ data: String) -> Bool {
        var dataRegEx = ""
        
        switch type {
        case .email:
            dataRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        default:
            dataRegEx = "(?=.*[A-Z0-9a-z]).{6,}"
        }
        
        let dataPredicate = NSPredicate(format: "SELF MATCHES %@", dataRegEx)
        return dataPredicate.evaluate(with: data)
    }
}

enum FieldType {
    case email, password, name
}
