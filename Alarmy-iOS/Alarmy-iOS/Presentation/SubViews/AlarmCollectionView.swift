//
//  AlarmCollectionView.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/16/25.
//

import UIKit

final class AlarmCollectionView: UICollectionView, UICollectionViewDataSource {
    
    private var itemData = AlarmModel.dummy()
    private static let cellHeight: CGFloat = 116
    private static let cellSpacing: CGFloat = 8
    private static let cellWidth: CGFloat = 345
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: Self.cellWidth, height: Self.cellHeight)
        flowLayout.minimumLineSpacing = Self.cellSpacing
        flowLayout.scrollDirection = .vertical

        super.init(frame: .zero, collectionViewLayout: flowLayout)
        self.backgroundColor = .clear
        self.dataSource = self
        self.showsVerticalScrollIndicator = false

        register()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func register() {
        register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: AlarmCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCollectionViewCell.identifier, for: indexPath) as? AlarmCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(itemData[indexPath.item], itemRow: indexPath.item)
        return cell
    }
    
    func calculatedAlarmCollectionViewHeight() -> CGFloat {
        let itemCount = itemData.count
        return CGFloat(itemCount) * Self.cellHeight + CGFloat(max(0, itemCount - 1)) * Self.cellSpacing
    }
}
