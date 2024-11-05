//
//  LoginViewController.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/2/24.
//

import UIKit

import SnapKit
import Then

// MARK: 서버 통신 실습을 위해 클로드로 제작하였습니다.
class LoginViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    
    private let idTextField = UITextField()
    
    private let passwordTextField = UITextField()
    
    private let loginButton = UIButton()
   
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setHierarchy()
        setLayout()
        setStyle()
        setActions()
    }
    
    private func setHierarchy() {
        view.addSubViews(titleLabel, idTextField, passwordTextField, loginButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }

    private func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "로그인"
            $0.font = .systemFont(ofSize: 24, weight: .bold)
            $0.textColor = .black
        }
        
        idTextField.do {
            $0.placeholder = "이메일을 입력하세요"
            $0.borderStyle = .roundedRect
            $0.keyboardType = .emailAddress
            $0.autocapitalizationType = .none
        }
        
        passwordTextField.do {
            $0.placeholder = "비밀번호를 입력하세요"
            $0.borderStyle = .roundedRect
            $0.isSecureTextEntry = true
        }
        
        loginButton.do {
            $0.setTitle("로그인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setActions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc private func loginButtonTapped() {
        // 로그인 로직 구현
        guard let username = idTextField.text,
              let password = passwordTextField.text,
              !username.isEmpty,
              !password.isEmpty else {
            // 알림 표시
            return
        }
        
        print("로그인 시도: \(username)")
    }
}
