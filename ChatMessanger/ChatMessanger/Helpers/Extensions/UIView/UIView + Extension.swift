//
//  UIView + Extension.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView ...) {
        views.forEach { self.addSubviews($0) }
    }
}
