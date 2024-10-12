//
//  AppIconDetailVi.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/12/24.
//

import UIKit

import SnapKit
import Then


protocol ShareDelegate : AnyObject {
    func dataBind(nickname: String)
}

class ModalViewController : UIViewController {
    
    var modalView = ModalView()
    weak var shareDelegate: ShareDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubViews(modalView)
        modalView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        modalView.finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func finishButtonTapped() {
        if let nickname = modalView.exampleTextField.text {
            shareDelegate?.dataBind(nickname: nickname)
        }
        self.dismiss(animated: true)
    }
}
