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

extension String {
    func truncate(to limit: Int, ellipsis: Bool = true) -> String {
        if count > limit {
            let truncated = String(prefix(limit)).trimmingCharacters(in: .whitespacesAndNewlines)
            return ellipsis ? truncated + "\u{2026}" : truncated
        } else {
            return self
        }
    }
}
