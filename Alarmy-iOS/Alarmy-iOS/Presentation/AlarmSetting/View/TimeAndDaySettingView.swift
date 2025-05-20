//
//  TimeAndDaySettingView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class TimeAndDaySettingView: UIView {
    // MARK: - UI Properties
    private lazy var timePicker = UIDatePicker()
    
    private let selectedDayLabel = UILabel()
    private let everyDayCheckButton = UIButton()
    private let everyDayCheckLabel = UILabel()
    private let everyDayCheckStackView = UIStackView()
    private let selectDayStackView = UIStackView()
    
    private let sunButton = DayButton()
    private let monButton = DayButton()
    private let tueButton = DayButton()
    private let wedButton = DayButton()
    private let thuButton = DayButton()
    private let friButton = DayButton()
    private let satButton = DayButton()
    private let selectDayButtonStackView = UIStackView()
    
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

extension TimeAndDaySettingView {
    // MARK: - UI Function
    private func setStyle() {
        timePicker.do {
            $0.preferredDatePickerStyle = .wheels
            $0.datePickerMode = .time
            $0.minuteInterval = 1
            $0.locale = Locale(identifier: "ko_KR")
            $0.tintColor = .appColor(.white)
            $0.setValue(UIColor.white, forKeyPath: "textColor")
        }
        
        selectedDayLabel.do {
            $0.text = "일, 월, 화, 수, 목, 금, 토"
            $0.textColor = .appColor(.white)
            $0.font = .body1
        }
        
        everyDayCheckButton.do {
            $0.setImage(.btnSettingCheckbox, for: .normal)
        }
        
        everyDayCheckLabel.do {
            $0.text = "매일"
            $0.textColor = .appColor(.white)
            $0.font = .body5
        }
        
        everyDayCheckStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fillProportionally
        }
        
        selectDayStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        sunButton.do {
            $0.setDay("일")
        }
        
        monButton.do {
            $0.setDay("월")
        }
        
        tueButton.do {
            $0.setDay("화")
        }
        
        wedButton.do {
            $0.setDay("수")
        }
        
        thuButton.do {
            $0.setDay("목")
        }
        
        friButton.do {
            $0.setDay("금")
        }
        
        satButton.do {
            $0.setDay("토")
        }
        
        selectDayButtonStackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
    }
    
    private func setHierarchy() {
        addSubViews(
            timePicker,
            everyDayCheckStackView,
            selectDayStackView,
            selectDayButtonStackView
        )
        
        everyDayCheckStackView.addArrangedSubViews(
            everyDayCheckButton,
            everyDayCheckLabel
        )
        
        selectDayStackView.addArrangedSubViews(
            selectedDayLabel,
            everyDayCheckStackView
        )
        
        selectDayButtonStackView.addArrangedSubViews(
            sunButton,
            monButton,
            tueButton,
            wedButton,
            thuButton,
            friButton,
            satButton
        )
    }
    
    private func setLayout() {
        timePicker.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(160)
        }
                
        selectDayStackView.snp.makeConstraints {
            $0.top.equalTo(timePicker.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        selectDayButtonStackView.snp.makeConstraints {
            $0.top.equalTo(selectDayStackView.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(self.snp.bottom)
        }
    }
}
