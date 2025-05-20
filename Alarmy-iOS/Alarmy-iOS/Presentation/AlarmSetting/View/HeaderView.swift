//
//  HeaderView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class HeaderView: UIView {
    
    // MARK: - UI Properties
    private let xButton = UIButton()
    private let timeUntilAlarmLabel = UILabel()
    private let headerStackView = UIStackView()
    private let headerBackgroundView = UIView()
    
    // MARK: - Life Cycle
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

extension HeaderView {
    // MARK: - UI Function
    private func setStyle() {
        xButton.do {
            $0.setImage(.icnSettingClose, for: .normal)
            $0.tintColor = .appColor(.white)
        }
        
        timeUntilAlarmLabel.do {
            $0.text = "8시간 33분 후에 울려요"
            $0.textColor = .appColor(.white)
            $0.font = .body2
        }
        
        headerStackView.do {
            $0.axis = .horizontal
            $0.spacing = 82
            $0.alignment = .center
            $0.distribution = .fillProportionally
        }
        
        headerBackgroundView.do {
            $0.backgroundColor = .appColor(.grey900)
        }
    }
    
    private func setHierarchy() {
        addSubViews(
            headerBackgroundView,
            headerStackView
        )
        
        headerStackView.addArrangedSubViews(
            xButton,
            timeUntilAlarmLabel
        )
    }
    
    private func setLayout() {
        headerBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(headerStackView.snp.bottom).offset(15)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview()
        }
    }
}
