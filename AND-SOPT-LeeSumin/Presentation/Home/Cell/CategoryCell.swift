//
//  CategoryCell.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/1/24.
//

import UIKit

import SnapKit
import Then

class CategoryCell: UICollectionViewCell {
    static let reuseIdentifier = "CategoryCell"
    
    private let imageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let subtitleLabel = UILabel()
    
    private let downloadButton = UIButton()
    
    private let dividerLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubViews(imageView, titleLabel, subtitleLabel, downloadButton, dividerLine)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(28)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(12)
            $0.trailing.equalTo(downloadButton.snp.leading).inset(12)
            $0.bottom.equalTo(contentView.snp.centerY).offset(-2)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(downloadButton.snp.leading).inset(12)
            $0.top.equalTo(contentView.snp.centerY).offset(2)
        }
        
        dividerLine.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    private func setUI() {
        imageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.backgroundColor = .systemGray6
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.textColor = .label
        }
        
        subtitleLabel.do {
            $0.font = .systemFont(ofSize: 14)
            $0.textColor = .secondaryLabel
        }
        
        downloadButton.do {
            $0.setTitle("받기", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.backgroundColor = .systemGray6
            $0.layer.cornerRadius = 14
            $0.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        }
    }
    
    func configure(with item: AppItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        imageView.image = item.image
    }
}
