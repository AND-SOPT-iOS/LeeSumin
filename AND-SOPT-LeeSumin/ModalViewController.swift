//
//  AppIconDetailVi.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/12/24.
//

import UIKit

import SnapKit
import Then

class ModalViewController : UIViewController {
    
    var modalView = ModalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubViews(modalView)
        modalView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }
    
}
