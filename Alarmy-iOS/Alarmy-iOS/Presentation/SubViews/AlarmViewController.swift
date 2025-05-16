//
//  AlarmViewController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

import SnapKit
import Then

final class AlarmViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let homeHeaderButton = UIButton()
    private let nextAlarmButton = UIButton()
    private let timeAlarmLabel = UILabel()
    private let alarmCollectionView = AlarmCollectionView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.updateCollectionViewHeight()
        }
    }

    // MARK: - UI Function
    private func updateCollectionViewHeight() {
        let totalHeight = alarmCollectionView.calculatedAlarmCollectionViewHeight()

        alarmCollectionView.snp.updateConstraints {
            $0.height.equalTo(totalHeight)
        }
    }

    private func setStyle() {
        view.backgroundColor = UIColor.appColor(.grey950)

        homeHeaderButton.do {
            $0.setImage(UIImage(named: "icon_header_menu"), for: .normal)
        }
        
        nextAlarmButton.do {
            var config = UIButton.Configuration.filled()
            let title = "다음 알람"

            let attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.body4,
                .foregroundColor: UIColor.white
            ]))

            config.attributedTitle = attributedTitle
            config.image = UIImage(named: "icon_home_arrow")
            config.baseBackgroundColor = UIColor.appColor(.grey900)
            config.imagePlacement = .trailing
            config.imagePadding = 4
            config.cornerStyle = .capsule

            $0.configuration = config
        }
        
        timeAlarmLabel.do {
            $0.text = "9시간 22분 후에 울려요"
            $0.textColor = UIColor.appColor(.grey100)
            $0.font = .title5
        }
    }
    
    private func setHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubViews(
            homeHeaderButton,
            nextAlarmButton,
            timeAlarmLabel,
            alarmCollectionView
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        homeHeaderButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(70)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(32)
        }
        
        nextAlarmButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(homeHeaderButton.snp.bottom).offset(16)
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(30)
        }
        
        timeAlarmLabel.snp.makeConstraints {
            $0.leading.equalTo(nextAlarmButton.snp.leading).offset(8)
            $0.top.equalTo(nextAlarmButton.snp.bottom).offset(16)
        }
        
        alarmCollectionView.snp.remakeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-14)
            $0.top.equalTo(timeAlarmLabel.snp.bottom).offset(32)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Function
    private func bind() {
        
    }
    
    private func setDelegate() {
        // delegate, datasource 모음
    }
    
    private func setAddTarget() {
        // addtarget 모음
    }
    
    // MARK: - objc
}
