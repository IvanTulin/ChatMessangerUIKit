//
//  RegistrationView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    
}

class RegistrationView: UIViewController {
    // MARK: - Visual Components
    
    private let pageTitleLabel: UILabel = {
        $0.text = .locolize("registrationTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var nameTextField: UITextField = TextField(filedPlaceholder: .locolize("namePlaceholder"))
    private lazy var emailTextField: UITextField = TextField(filedPlaceholder: "Email")
    private lazy var passwordTextField: UITextField = TextField(filedPlaceholder: .locolize("passwordPlaceholder "))
    private lazy var registrationButton: UIButton = AppButton(buttonText: .locolize("registrationButtonText")) { [weak self] in
        let userInfo = UserInfo(email: self?.emailTextField.text ?? "", password: self?.passwordTextField.text ?? "", name: self?.nameTextField.text ?? "")
        self?.presenter.sendToRegist(userInfo: userInfo)
        
        print(#function)
    }
    private lazy var bottomButton: UIButton = AppButton(buttonText: .locolize("authTitleLabel"), buttonColor: .clear, titleColor: .white) {
        print(#function)
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.auth])
    }
    
    
    // MARK: - Public Properties
    
    var presenter: RegistrationViewPresenterProtocol!
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setConstraints()
    }
    
    // MARK: - Private Properties
    private func addSubviews() {
        view.addSubview(pageTitleLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registrationButton)
        view.addSubview(bottomButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameTextField.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -35),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            registrationButton.heightAnchor.constraint(equalToConstant: 50),
            registrationButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            registrationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            registrationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButton.heightAnchor.constraint(equalToConstant: 30),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            

        ])
    }


}

extension RegistrationView: RegistrationViewProtocol {
    
}
