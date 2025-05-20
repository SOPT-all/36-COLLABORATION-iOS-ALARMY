//
//  EtcSettingView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class EtcSettingView: UIView {
    
    // MARK: - UI Properties
    
    private let delayAlarmLabel = UILabel()
    private let delayInfoLabel = UILabel()
    private let delayAlarmMoreButton = MoreButton()
    private let delayAlarmMoreStackView = UIStackView()
    private let delayAlarmStackView = UIStackView()
    
    private let memoLabel = UILabel()
    private let memoTextView = UILabel()
    private let memoMoreButton = MoreButton()
    private let memoMoreStackView = UIStackView()
    private let memoStackView = UIStackView()
    
    private let preventSleepLabel = UILabel()
    private let lockImageView = UIImageView()
    private let preventSleepLabelStackView = UIStackView()
    private let preventSleepMoreButton = MoreButton()
    private let preventSleepStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EtcSettingView {
    private func setStyle() {
        delayAlarmLabel.do {
            $0.text = "알람 미루기"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        delayInfoLabel.do {
            $0.text = "5분, 3회"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        delayAlarmMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        delayAlarmMoreStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        delayAlarmStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        memoLabel.do {
            $0.text = "메모"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        memoTextView.do {
            $0.text = "메모 없음"
            $0.textColor = .appColor(.grey500)
            $0.font = .body6
        }
        
        memoMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        memoMoreStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        memoStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        preventSleepLabel.do {
            $0.text = "다시 잠들기 방지"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        lockImageView.do {
            $0.image = .icnSettingLock
        }
        
        preventSleepLabelStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        preventSleepMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        preventSleepStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
    }
    
    private func setHierarchy() {
        addSubViews(
            delayAlarmStackView,
            memoStackView,
            preventSleepStackView
        )
        
        delayAlarmMoreStackView.addArrangedSubViews(
            delayInfoLabel,
            delayAlarmMoreButton
        )
        
        delayAlarmStackView.addArrangedSubViews(
            delayAlarmLabel,
            delayAlarmMoreStackView
        )
        
        memoMoreStackView.addArrangedSubViews(
            memoTextView,
            memoMoreButton
        )
        
        memoStackView.addArrangedSubViews(
            memoLabel,
            memoMoreStackView
        )
        
        preventSleepLabelStackView.addArrangedSubViews(
            preventSleepLabel,
            lockImageView
        )
        
        preventSleepStackView.addArrangedSubViews(
            preventSleepLabelStackView,
            preventSleepMoreButton
        )
    }
    
    private func setLayout() {
        delayAlarmStackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        memoStackView.snp.makeConstraints {
            $0.top.equalTo(delayAlarmStackView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        lockImageView.snp.makeConstraints {
            $0.width.equalTo(12)
            $0.height.equalTo(13)
        }
        
        preventSleepStackView.snp.makeConstraints {
            $0.top.equalTo(memoStackView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
}
