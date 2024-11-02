//
//  HeaderCell.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/2/24.
//

import UIKit

import SnapKit
import Then

final class HeaderCell: UICollectionViewCell {

    static let reuseIdentifier = "HeaderCell"
    
    private let titleLabel = UILabel()
    
    private let subtitleLabel = UILabel()
    
    private let chevronImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubViews(titleLabel, subtitleLabel, chevronImageView)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        chevronImageView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing)
            $0.width.height.equalTo(24)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func setUI() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.textColor = .label
        }
        
        subtitleLabel.do {
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .secondaryLabel
        }
        
        chevronImageView.do {
            $0.image = UIImage(systemName: "chevron.right")
            $0.tintColor = .secondaryLabel
            $0.contentMode = .scaleAspectFit
        }
        
    }
    
    func configure(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
