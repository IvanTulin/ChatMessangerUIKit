//
//  TextField.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

class TextField: UITextField {
    // MARK: - Puplic Properties
    
    var filedPlaceholder: String
    var isPassword: Bool
    
    //MARK: - Initializers
    
    init(frame: CGRect = .zero, filedPlaceholder: String, isPassword: Bool = false ) {
        self.filedPlaceholder = filedPlaceholder
        self.isPassword = isPassword
        
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTextField() {
        placeholder = filedPlaceholder
        isSecureTextEntry = isPassword
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        rightViewMode = .always
        backgroundColor = .white
        textColor = .black
        layer.cornerRadius = 10
    }
}
