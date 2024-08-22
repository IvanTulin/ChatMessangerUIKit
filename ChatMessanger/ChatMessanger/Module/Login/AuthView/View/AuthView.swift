//
//  AuthView.swift
//  ChatMessanger
//
//  Created by Ivan Tulin on 20.08.2024.
//

import UIKit

protocol AuthViewProtocol: AnyObject {
    
}

class AuthView: UIViewController {
    // MARK: - Visual Components
    
    private let pageTitleLabel: UILabel = {
        $0.text = .locolize("authTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var emailTextField: UITextField = TextField(filedPlaceholder: "Email")
    private lazy var passwordTextField: UITextField = TextField(filedPlaceholder: .locolize("passwordPlaceholder "))
    private lazy var authButton: UIButton = AppButton(buttonText: .locolize("authButtonText")) { [weak self] in
        print(#function)
        
        guard let self = self else { return }
        let userInfo = UserInfo(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        presenter.signIn(userInfo: userInfo)
    }
    private lazy var bottomButton: UIButton = AppButton(buttonText: .locolize("registrationButtonText"), buttonColor: .clear, titleColor: .white) {
        print(#function)
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.registration])
    }
    
    // MARK: - Public Properties
    
    var presenter: AuthViewPresenterProtocol!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(pageTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(authButton)
        view.addSubview(bottomButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            
            authButton.heightAnchor.constraint(equalToConstant: 50),
            authButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 80),
            authButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButton.heightAnchor.constraint(equalToConstant: 30),
            bottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),

        ])
    }
    
}

extension AuthView: AuthViewProtocol {
    
}
