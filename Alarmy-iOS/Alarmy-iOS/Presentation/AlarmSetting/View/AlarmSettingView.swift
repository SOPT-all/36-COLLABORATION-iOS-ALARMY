//
//  AlarmSettingView.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/17/25.
//

import UIKit

import SnapKit
import Then

final class AlarmSettingView: UIView {
    // MARK: - UI Properties
    let headerView = HeaderView()
    
    private let alarmSettingScrollView = UIScrollView()
    private let alarmSettingScrollContentView = UIView()
    
    let timeAndDaySettingView = TimeAndDaySettingView()
    private let divider1 = SectionDivider()
    private let missionSettingView = MissionSettingView()
    private let divider2 = SectionDivider()
    private let soundSettingView = SoundSettingView()
    private let divider3 = SectionDivider()
    private let etcSettingView = EtcSettingView()
    
    let saveButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
        
        isUserInteractionEnabled = true
        
        timeAndDaySettingView.isTimeChanged = { [weak self] newDate in
            self?.headerView.updateAlarmLabel(to: newDate)
        }
        timeAndDaySettingView.isTimeChanged?(Date())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlarmSettingView: ViewConfigurable {
    // MARK: - UI Function
    func setStyle() {
        alarmSettingScrollView.isScrollEnabled = true
        
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.titleLabel?.font = .body1
            $0.backgroundColor = .appColor(.redPrimary)
            $0.layer.cornerRadius = 8
        }
    }
    
    func setHierarchy() {
        addSubViews(
            headerView,
            alarmSettingScrollView,
            saveButton
        )
        
        alarmSettingScrollView.addSubViews(
            alarmSettingScrollContentView
        )
        
        alarmSettingScrollContentView.addSubViews(
            timeAndDaySettingView,
            divider1,
            missionSettingView,
            divider2,
            soundSettingView,
            divider3,
            etcSettingView
        )
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(62)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        alarmSettingScrollView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        alarmSettingScrollContentView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(alarmSettingScrollView.contentLayoutGuide)
            $0.width.equalTo(alarmSettingScrollView.frameLayoutGuide)
        }
        
        timeAndDaySettingView.snp.makeConstraints {
            $0.top.equalTo(alarmSettingScrollContentView.snp.top)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(timeAndDaySettingView.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        missionSettingView.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(missionSettingView.snp.bottom)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        soundSettingView.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        divider3.snp.makeConstraints {
            $0.top.equalTo(soundSettingView.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        etcSettingView.snp.makeConstraints {
            $0.top.equalTo(divider3.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
            $0.bottom.equalTo(alarmSettingScrollContentView.snp.bottom).inset(127)
        }
                
        saveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(16)
        }
    }
}
