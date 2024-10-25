//
//  ModalView.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/12/24.
//

import UIKit

import SnapKit
import Then

class ModalView: UIView {
    
    var exampleTextField : UITextField = UITextField()
    
    var finishButton : UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubViews(exampleTextField, finishButton)
    }

    private func setLayout() {
        
        exampleTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        finishButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
      
    }
    
    private func setStyle() {
        self.backgroundColor = .white
        
        exampleTextField.do {
            $0.placeholder = "입력 ㄱㄱ"
            $0.borderStyle = .roundedRect
        }
       
        finishButton.do {
            $0.backgroundColor = .blue
        }
    }

    
}
