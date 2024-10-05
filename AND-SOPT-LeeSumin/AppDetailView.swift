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
            <#T##other: any ConstraintRelatableTarget##any ConstraintRelatableTarget#>)
        }
        
        appIcon.snp.makeConstraints {
            
        }
        
        appTitle.snp.makeConstraints {
            
        }
        
        appDescription.snp.makeConstraints {
            
        }
        
        appInstallButton.snp.makeConstraints {
            
        }
    }
    
    private func setStyle() {
        
    }

    
}
