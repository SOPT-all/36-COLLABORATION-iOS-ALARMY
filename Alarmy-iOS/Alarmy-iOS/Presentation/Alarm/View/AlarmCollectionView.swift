//
//  AlarmCollectionView.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/16/25.
//

import UIKit

final class AlarmCollectionView: UICollectionView {
    
    // MARK: - Properties
    private var itemData: [AlarmEntity] = []
    private static let cellHeight: CGFloat = 116
    private static let cellSpacing: CGFloat = 8
    private static let cellWidth: CGFloat = 345
    
    // MARK: - Initializer
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: Self.cellWidth, height: Self.cellHeight)
        flowLayout.minimumLineSpacing = Self.cellSpacing
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.sectionInset.top = 8

        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.backgroundColor = .clear
        self.dataSource = self
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = false

        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        register(AlarmCollectionViewCell.self,
                 forCellWithReuseIdentifier: AlarmCollectionViewCell.identifier)
        register(AlarmCollectionHeaderView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: AlarmCollectionHeaderView.identifier)
    }
    
    func updateData(with data: [AlarmEntity]) {
        self.itemData = data
        self.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: AlarmCollectionHeaderView.identifier,
                for: indexPath
            ) as? AlarmCollectionHeaderView else {
                fatalError("Could not dequeue AlarmCollectionHeaderView")
            }
            header.configure()
            return header
        }

        return UICollectionReusableView()
    }

    func calculatedAlarmCollectionViewHeight() -> CGFloat {
        let itemCount = itemData.count
        let totalCellHeight = CGFloat(itemCount) * Self.cellHeight
        let totalSpacing = CGFloat(max(0, itemCount - 1)) * Self.cellSpacing
        let headerHeight: CGFloat = 77

        return headerHeight * 2 + totalCellHeight + totalSpacing
    }
}

extension AlarmCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCollectionViewCell.identifier, for: indexPath) as? AlarmCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

extension AlarmCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: Self.cellWidth, height: 77)
    }
}
