//
//  MissionCollectionViewCell.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/15/25.
//

import UIKit

final class MissionCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier: String = "MissionCollectionViewCell"
    private let missionImages: [UIImage?] = [
        UIImage(resource: .btnSettingMissionSolid),
        UIImage(resource: .btnSettingMissionDotted),
        UIImage(resource: .btnSettingMissionDotted),
        UIImage(resource: .btnSettingMissionDotted),
        UIImage(resource: .btnSettingMissionDotted)
    ]
    
    // MARK: - UI Properties
    private let createMissionButton = UIButton()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Function
    private func setLayout() {
        createMissionButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(68)
        }
    }
    
    private func setHierarchy() {
        self.addSubview(createMissionButton)
    }
    
    // MARK: - Function
    func setImage(index: Int) {
        if index < missionImages.count {
            createMissionButton.setImage(missionImages[index], for: .normal)
        } else {
            createMissionButton.setImage(nil, for: .normal)
        }
    }
}
