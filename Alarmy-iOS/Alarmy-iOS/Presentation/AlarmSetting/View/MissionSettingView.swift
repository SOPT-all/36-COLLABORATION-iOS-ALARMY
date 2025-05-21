//
//  MissionSettingView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class MissionSettingView: UIView {
    
    // MARK: - UI Properties
    private let missionLabel = UILabel()
    private let missionCountLabel = UILabel()
    private let missionLabelStackView = UIStackView()
    private let missionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let missionStackView = UIStackView()
    
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
        
        register()
        setDelegate()
        setCollectionviewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MissionSettingView: ViewConfigurable {
    // MARK: - UI Function
    func setStyle() {
        missionLabel.do {
            $0.text = "미션"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        missionCountLabel.do {
            $0.text = "0/5"
            $0.textColor = .appColor(.grey300)
            $0.font = .body7
        }
        
        missionLabelStackView.do {
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fillEqually
            $0.alignment = .center
        }
        
        missionStackView.do {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        missionCollectionView.do {
            $0.backgroundColor = .clear
            $0.touchesShouldCancel(in: $0)
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setHierarchy() {
        addSubViews(
            missionLabelStackView,
            missionCollectionView
        )
        
        missionLabelStackView.addArrangedSubViews(
            missionLabel,
            missionCountLabel
        )
        
//        missionStackView.addArrangedSubViews(
//            missionLabelStackView,
//            missionCollectionView
//        )
    }
    
    func setLayout() {
        missionLabelStackView.snp.makeConstraints {
            $0.top.equalTo(missionCollectionView.snp.top).offset(10.5)
            $0.leading.equalToSuperview().inset(20)
        }
        
        missionCollectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(missionLabelStackView.snp.trailing).offset(20)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(68)
            $0.bottom.equalTo(self.snp.bottom).inset(20)
        }
        
        // TODO: StackView로 맞추기 .. 시도하기
//        missionStackView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.trailing.equalToSuperview()
//            $0.bottom.equalTo(self.snp.bottom)
//        }
    }
}

extension MissionSettingView {
    // MARK: - Function
    private func register() {
        missionCollectionView.register(
            MissionCollectionViewCell.self,
            forCellWithReuseIdentifier: MissionCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        missionCollectionView.delegate = self
        missionCollectionView.dataSource = self
    }
    
    private func setCollectionviewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        missionCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
}

// MARK: - CollectionView Delegate
extension MissionSettingView: UICollectionViewDelegate {
    
}

extension MissionSettingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: - 미션 개수로 바꾸야하는디 ....
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCollectionViewCell.identifier, for: indexPath) as? MissionCollectionViewCell else { return UICollectionViewCell() }
        cell.setImage(index: indexPath.item)
        return cell
    }
}

extension MissionSettingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 68, height: 68)
    }
    
    private func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                                minimumLineSpacingForSectionAt section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}
