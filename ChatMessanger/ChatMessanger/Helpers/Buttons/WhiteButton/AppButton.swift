//
//  WhiteButton.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

class AppButton: UIButton {
    var buttonText: String
    var buttonColor: UIColor
    var titleColor: UIColor
    var completion: () -> Void
    
    
    init(buttonText: String, buttonColor: UIColor = .white, titleColor: UIColor = .black, completion: @escaping () -> Void) {
        self.buttonText = buttonText
        self.completion = completion
        self.buttonColor = buttonColor
        self.titleColor = titleColor
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        addAction(UIAction(handler: { [weak self] _ in
            guard let self else { return }
            self.completion()
        }), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(buttonText, for: .normal)
        backgroundColor = buttonColor
        setTitleColor(titleColor, for: .normal)
        layer.cornerRadius = 10
    }
}
