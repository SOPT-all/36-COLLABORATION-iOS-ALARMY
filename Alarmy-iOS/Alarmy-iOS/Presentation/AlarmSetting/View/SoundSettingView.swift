//
//  SoundSettingView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class SoundSettingView: UIView {
    
    // MARK: - Properties
    private var isVibrationOn: Bool = false {
        didSet { updateVibrationButtonState() }
    }
    
    private var lastSnapValue: Float = -1
    
    // MARK: UI Properties
    private let minimumVolumeImageView = UIImageView()
    private let volumeSlider = UISlider()
    private let maximumVolumeImageView = UIImageView()
    private let verticalDivider = UIView()
    private let vibrationButton = UIButton()
    private let volumeAndVibrationStackView = UIStackView()
    
    private let soundLabel = UILabel()
    private let cheerfulMorningLabel = UILabel()
    private let soundMoreButton = MoreButton()
    private let soundMoreStackView = UIStackView()
    private let soundStackView = UIStackView()
    
    private let soundPowerUpLabel = UILabel()
    private let soundPowerUpCountLabel = UILabel()
    private let soundPowerUpMoreButton = MoreButton()
    private let soundPowerUpMoreStackView = UIStackView()
    private let soundPowerUpStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SoundSettingView {
    private func setStyle() {
        minimumVolumeImageView.do {
            $0.image = .icnSettingSoundOff
        }
        
        volumeSlider.do {
            $0.minimumValue = 0
            $0.maximumValue = 100
            $0.isContinuous = true
            $0.tintColor = .appColor(.bluePrimary)
            $0.setThumbImage(.icnSettingSliderThumb, for: .normal)
        }
        
        maximumVolumeImageView.do {
            $0.image = .icnSettingSoundOn
        }
        
        verticalDivider.do {
            $0.backgroundColor = .appColor(.grey700)
        }
        
        vibrationButton.do {
            $0.setImage(.btnSettingVibrationFalse, for: .normal)
            $0.setImage(.btnSettingVibrationTrue, for: .selected)
        }
        
        volumeAndVibrationStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        soundLabel.do {
            $0.text = "사운드"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        cheerfulMorningLabel.do {
            $0.text = "활기찬 아침"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        soundMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        soundMoreStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        soundStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        soundPowerUpLabel.do {
            $0.text = "사운드 파워업"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        soundPowerUpCountLabel.do {
            $0.text = "1개 사용"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        soundPowerUpMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        soundPowerUpMoreStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        soundPowerUpStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
    }
    
    private func setHierarchy() {
        addSubViews(
            volumeAndVibrationStackView,
            soundStackView,
            soundPowerUpStackView
        )
        
        volumeAndVibrationStackView.addArrangedSubViews(
            minimumVolumeImageView,
            volumeSlider,
            maximumVolumeImageView,
            verticalDivider,
            vibrationButton
        )
        
        soundMoreStackView.addArrangedSubViews(
            cheerfulMorningLabel,
            soundMoreButton
        )
        
        soundStackView.addArrangedSubViews(
            soundLabel,
            soundMoreStackView
        )
        
        soundPowerUpMoreStackView.addArrangedSubViews(
            soundPowerUpCountLabel,
            soundPowerUpMoreButton
        )
        
        soundPowerUpStackView.addArrangedSubViews(
            soundPowerUpLabel,
            soundPowerUpMoreStackView
        )
    }
    
    private func setLayout() {
        minimumVolumeImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        volumeSlider.snp.makeConstraints {
            $0.width.equalTo(227)
        }
        
        maximumVolumeImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.width.equalTo(0.5)
            $0.height.equalTo(24)
        }
        
        volumeAndVibrationStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        soundStackView.snp.makeConstraints {
            $0.top.equalTo(volumeAndVibrationStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        soundPowerUpStackView.snp.makeConstraints {
            $0.top.equalTo(soundStackView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
    
    // MARK: - Function
    
    private func setAddTarget() {
        vibrationButton.addTarget(self, action: #selector(vibrationButtonTapped), for: .touchUpInside)
        volumeSlider.addTarget(self, action: #selector(volumeSliderChanged(_:)), for: .valueChanged)
    }
    
    private func updateVibrationButtonState() {
        vibrationButton.isSelected = isVibrationOn
    }
    
    // MARK: - objc
    @objc
    private func vibrationButtonTapped() {
        isVibrationOn.toggle()
    }
    
    @objc
    private func volumeSliderChanged(_ sender: UISlider) {
        let snapStep: Float = 10
        let newValue = round(sender.value / snapStep) * snapStep
        sender.setValue(newValue, animated: false)
        
        if newValue != lastSnapValue {
            lastSnapValue = newValue
        }
    }
    
}
