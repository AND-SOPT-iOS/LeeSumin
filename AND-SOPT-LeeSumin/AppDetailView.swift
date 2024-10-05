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
    
    private var appIcon : UIImageView = UIImageView()
    
    private var appTitle : UILabel = UILabel()
    
    private var appDescription : UILabel = UILabel()
    
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
                                appDescription)
    }

    private func setLayout() {
        appInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(ScreenUtils.height * 0.2)
        }
        
        appIcon.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.width.height.equalTo(80)
        }
        
        appTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(140)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        appDescription.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(140)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(10)
        }
        
        appInstallButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(140)
            $0.bottom.equalToSuperview()
            $0.width.equalTo(60)
        }
    }
    
    private func setStyle() {
        
    }

    
}
