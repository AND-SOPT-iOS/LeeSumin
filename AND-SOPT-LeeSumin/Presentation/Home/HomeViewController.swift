//
//  HomeViewController.swift
//  AND-SOPT-LeeSumin
//
//  Created by 이수민 on 11/1/24.
//


import UIKit

import SnapKit
import Then

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewLayout()
    ).then {
        $0.backgroundColor = .systemBackground
        $0.register(FeaturedCell.self,
                   forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        $0.register(CategoryCell.self,
                   forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<AppStoreSectionType, AppItem>!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setCollectionView()
        configureDataSource()
        applyInitialSnapshots()
    }
    
    // MARK: - Setup
    private func setUI() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<AppStoreSectionType, AppItem>(
            collectionView: collectionView
        ) { collectionView, indexPath, item in
            switch AppStoreSectionType.allCases[indexPath.section] {
            case .featured:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FeaturedCell.reuseIdentifier,
                    for: indexPath
                ) as! FeaturedCell
                cell.configure(with: item)
                return cell
                
            case .categories:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CategoryCell.reuseIdentifier,
                    for: indexPath
                ) as! CategoryCell
                cell.configure(with: item)
                return cell
            }
        }
    }
    
    private func applyInitialSnapshots() {
        let featuredItems = [
            AppItem(title: "TVING", subtitle: "2024-2025 KCC 프로농구", image: UIImage(resource: .tving)),
            AppItem(title: "TVING", subtitle: "2024-2025 KCC 프로농구", image: UIImage(resource: .tving)),
            AppItem(title: "TVING", subtitle: "2024-2025 KCC 프로농구", image: UIImage(resource: .tving)),
        ]
        
        let categoryItems = [
            AppItem(title: "데이트로드", subtitle: "커플들이 직접 공유하는 데이트 코스", image: UIImage(resource: .appIcon)),
            AppItem(title: "데이트로드", subtitle: "커플들이 직접 공유하는 데이트 코스", image: UIImage(resource: .appIcon)),
            AppItem(title: "데이트로드", subtitle: "커플들이 직접 공유하는 데이트 코스", image: UIImage(resource: .appIcon)),
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<AppStoreSectionType, AppItem>()
        
        snapshot.appendSections([.featured, .categories])

        snapshot.appendItems(featuredItems, toSection: .featured)
        snapshot.appendItems(categoryItems, toSection: .categories)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: - Layout
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let sectionType = AppStoreSectionType(rawValue: sectionIndex) else { return nil }
            
            switch sectionType {
            case .featured:
                return self?.createFeaturedSection()
            case .categories:
                return self?.createCategoriesSection()
            }
        }.then {
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            $0.configuration = config
        }
        
        return layout
    }
    
    private func createFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .absolute(350)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        return NSCollectionLayoutSection(group: group).then {
            $0.orthogonalScrollingBehavior = .groupPaging
            $0.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            $0.interGroupSpacing = 10
        }
    }
    
    private func createCategoriesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        return NSCollectionLayoutSection(group: group).then {
            $0.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            $0.interGroupSpacing = 10
        }
    }
}
