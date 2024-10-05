//
//  AppDetailView.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 10/5/24.
//

import UIKit
import SnapKit
import Then

class AppDetailView: UIView {

    private var appInfoView: UIView = UIView()
    
    var appIcon : UIImageView = UIImageView()
    
    var appTitle : UILabel = UILabel()
    
    var appDescription : UILabel = UILabel()
    
    private var appInstallButton : UIButton = UIButton()
    
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
        self.addSubViews(appInfoView)
        appInfoView.addSubViews(appIcon,
                                appTitle,
                                appDescription,
                                appInstallButton)
    }

    private func setLayout() {
        appInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(ScreenUtils.height * 0.2)
        }
        
        appIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(110)
        }
        
        appTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(150)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(55)
        }
        
        appDescription.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview().inset(150)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(15)
        }
        
        appInstallButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(90)
            $0.leading.equalToSuperview().inset(150)
            $0.bottom.equalTo(appIcon.snp.bottom)
            $0.width.equalTo(60)
        }
    }
    
    private func setStyle() {
        self.backgroundColor = .white
        
        appInfoView.do {
            $0.backgroundColor = .white
        }
        
        appIcon.do {
            $0.image = UIImage(resource: .appIcon)
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
        
        appTitle.do {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 20, weight: .semibold)
            $0.numberOfLines = 2
        }
        
        appDescription.do {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 12, weight: .light)
        }
        
        appInstallButton.do {
            $0.backgroundColor = .systemBlue
            $0.layer.cornerRadius = 12
            $0.setTitleColor(.white, for: .normal)
            $0.setTitle("설치", for: .normal)
        }
        
        
    }

    
}
