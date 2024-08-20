//
//  String+Extension.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import Foundation

extension String {
    static func locolize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

extension String {
    static let state = "state"
}
