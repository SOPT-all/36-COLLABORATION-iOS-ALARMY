//
//  AlarmCollectionHeaderView.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/16/25.
//

import UIKit
import SnapKit

final class AlarmCollectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    static let identifier = "AlarmCollectionHeaderView"
    
    // MARK: - UI Properties
    private let soundImageView = UIImageView()
    private let invitationBenefitLabel = UILabel()
    private let shareWithFriendsLabel = UILabel()
    private let shareButton = UIButton()
    private let bottomSpacingView = UIView()
}

extension AlarmCollectionHeaderView {
    // MARK: - UI Function
    func configure() {
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    private func setStyle() {
        backgroundColor = UIColor.appColor(.grey900)
        layer.cornerRadius = 15
        layer.masksToBounds = true

        soundImageView.do {
            $0.image = .icnHomeSound
        }
        
        invitationBenefitLabel.do {
            $0.text = "친구 초대하면 프리미엄이 무제한!"
            $0.textColor = UIColor.appColor(.grey100)
            $0.font = .body4
        }
        
        shareWithFriendsLabel.do {
            $0.text = "친구한테 소문내기"
            $0.textColor = UIColor.appColor(.grey100)
            $0.font = .body1
        }
        
        shareButton.do {
            $0.setImage(.iconHomeArrow, for: .normal)
            $0.tintColor = UIColor.appColor(.grey100)
        }
    }
    
    private func setHierarchy() {
        addSubViews(
            soundImageView,
            invitationBenefitLabel,
            shareWithFriendsLabel,
            shareButton
        )
    }
    
    private func setLayout() {
        soundImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.height.equalTo(45)
        }
        
        invitationBenefitLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17.5)
            $0.leading.equalTo(soundImageView.snp.trailing).offset(12)
            $0.height.equalTo(18)
        }
        
        shareWithFriendsLabel.snp.makeConstraints {
            $0.top.equalTo(invitationBenefitLabel.snp.bottom)
            $0.leading.equalTo(soundImageView.snp.trailing).offset(12)
            $0.height.equalTo(24)
        }
        
        shareButton.snp.makeConstraints {
            $0.centerY.equalTo(shareWithFriendsLabel.snp.centerY)
            $0.leading.equalTo(shareWithFriendsLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(16)
        }
    }
}
