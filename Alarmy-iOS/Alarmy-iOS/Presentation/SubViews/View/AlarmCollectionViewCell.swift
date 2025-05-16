//
//  AlarmCollectionViewCell.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/15/25.
//

import UIKit
import SnapKit

final class AlarmCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "AlarmCollectionViewCell"
    static let dayOfWeekList: [String] = ["일", "월", "화", "수", "목", "금", "토"]
    private var itemRow: Int?
    
    // MARK: - UI Properties
    private let dayOfWeekLabel = UILabel()
    private let ampmLabel = UILabel()
    private let timeLabel = UILabel()
    private let missionButton = UIButton()
    private let toggleButton = UIButton()
    private let menuButton = UIButton()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - objc
    @objc
    private func toggleButtonTapped() {
        toggleButton.isSelected.toggle()
    }
}

extension AlarmCollectionViewCell {
    // MARK: - UI Function
    private func setStyle() {
        dayOfWeekLabel.do {
            $0.font = .body3
            $0.textColor = UIColor.appColor(.grey500)
            $0.text = Self.dayOfWeekList.joined(separator: " ")
            $0.textAlignment = .center
        }
        
        ampmLabel.do {
            $0.font = .title3
            $0.textColor = UIColor.appColor(.grey500)
            $0.text = "오전"
            $0.textAlignment = .center
        }
        
        timeLabel.do {
            $0.font = .title2
            $0.textColor = UIColor.appColor(.grey500)
            $0.text = "7:20"
            $0.textAlignment = .center
        }
        
        missionButton.do {
            var config = UIButton.Configuration.plain()
            let title = "미션"

            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.body4,
                .foregroundColor: UIColor.appColor(.grey500)
            ]))
            
            config.image = UIImage(named: "icon_alarm_null")
            config.imagePlacement = .trailing
            config.imagePadding = 4
            
            config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            config.background.backgroundColor = .clear
            config.cornerStyle = .fixed

            $0.configuration = config
            $0.sizeToFit()
        }
        
        toggleButton.do {
            $0.setImage(UIImage(named: "boolean_home_off"), for: .normal)
            $0.setImage(UIImage(named: "boolean_home_on"), for: .selected)
            $0.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        }
        
        menuButton.do {
            $0.setImage(UIImage(named: "icon_alarm_menu"), for: .normal)
        }
    }
    
    private func setHierarchy() {
        contentView.addSubViews(
            dayOfWeekLabel,
            ampmLabel,
            timeLabel,
            missionButton,
            toggleButton,
            menuButton
        )
    }
    
    private func setLayout() {
        self.backgroundColor = UIColor.appColor(.grey900)
        self.layer.cornerRadius = 16
        
        dayOfWeekLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(12)
            $0.height.equalTo(18)
        }
        
        ampmLabel.snp.makeConstraints {
            $0.leading.equalTo(dayOfWeekLabel.snp.leading)
            $0.top.equalTo(dayOfWeekLabel.snp.bottom).offset(15)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(ampmLabel.snp.trailing).offset(4)
            $0.top.equalTo(dayOfWeekLabel.snp.bottom).offset(4)
        }
        
        missionButton.snp.makeConstraints {
            $0.leading.equalTo(dayOfWeekLabel.snp.leading)
            $0.top.equalTo(ampmLabel.snp.bottom).offset(17)
            $0.width.greaterThanOrEqualTo(41)
            $0.height.greaterThanOrEqualTo(18)
        }
        
        toggleButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(dayOfWeekLabel.snp.top).offset(15)
            $0.width.greaterThanOrEqualTo(54)
            $0.height.greaterThanOrEqualTo(32)
        }
        
        menuButton.snp.makeConstraints {
            $0.trailing.equalTo(toggleButton.snp.trailing)
            $0.centerY.equalTo(missionButton.snp.centerY)
            $0.width.height.equalTo(16)
        }
    }
}

extension AlarmCollectionViewCell {
    func dataBind(_ itemData: AlarmModel, itemRow: Int) {
        ampmLabel.text = itemData.ampmLabel
        timeLabel.text = itemData.timeLabel
        self.itemRow = itemRow
    }
}
