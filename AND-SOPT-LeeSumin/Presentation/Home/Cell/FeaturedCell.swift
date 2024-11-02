//
//  FeaturedCell.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/1/24.
//

import UIKit

import SnapKit
import Then

class FeaturedCell: UICollectionViewCell {
    static let reuseIdentifier = "FeaturedCell"
    
    private let imageView = UIImageView()
    
    private let titleLabel = UILabel()
    
    private let subtitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubViews(imageView, titleLabel, subtitleLabel)
        setLayout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    private func setUI() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12
        
        imageView.do {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.backgroundColor = .systemGray5
            $0.layer.cornerRadius = 12
        }
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 22, weight: .bold)
            $0.textColor = .label
        }
        
        subtitleLabel.do {
            $0.font = .systemFont(ofSize: 16, weight: .regular)
            $0.textColor = .secondaryLabel
        }
    }
    
    func configure(with item: AppItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        imageView.image = item.image
    }
}
