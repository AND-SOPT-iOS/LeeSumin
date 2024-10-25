//
//  ViewController.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/5/24.
//

import UIKit
import SnapKit

class AppDetailViewController: UIViewController {

    var appDetailView = AppDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubViews(appDetailView)
        appDetailView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
        setAppDetailView()
    }
    
    func setAppDetailView() {
        appDetailView.appIcon.image = UIImage(resource: .appIcon)
        appDetailView.appTitle.text = StringLiterals.AppDetailView.appName
        appDetailView.appDescription.text = "쉽고 빠른 데이트 코스 짜기"
        appDetailView.shareButton.addTarget(self, action: #selector(tapShareButon), for: .touchUpInside)
    }
    
    @objc
    func tapShareButon() {
        self.present(ModalViewController(), animated: true)
    }

    
}

