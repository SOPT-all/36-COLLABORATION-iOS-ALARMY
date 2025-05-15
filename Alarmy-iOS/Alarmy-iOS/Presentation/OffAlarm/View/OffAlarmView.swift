//
//  OffAlarmView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class OffAlarmView: UIView {

    // MARK: - Properties
    private let backgroundImageView = UIImageView()
    
    private let dateLabel = UILabel()
    private let timeLabel = UILabel()
    
    private let postponeView = UIView()
    private let labelBackgroundView = UIView()
    private let countLabel = CountBaseLabel()
    private let postponeLabel = UILabel()
    
    private let offButton = UIButton()
    
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
    
}

// MARK: - ViewConfigurable protocol
// TODO: 머지하고 프로토콜 채택하기 ~
extension OffAlarmView {
    func setStyle() {
        backgroundImageView.do {
            $0.image = .stopBackground
        }
        
        dateLabel.do {
            $0.text = "4월 22일 화요일"
            $0.textColor = .white
            $0.font = .title6
        }
        
        timeLabel.do {
            $0.text = "10:50"
            $0.textColor = .white
            $0.font = .title1
            $0.layer.addShadow(
                color: .black,
                alpha: 0.25,
                x: 0,
                y: 0,
                blur: 10,
                spread: 0
            )
        }
        
        postponeView.do {
            $0.backgroundColor = .white
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 8)
            $0.layer.addShadow(
                color: .black,
                alpha: 0.25,
                x: 0,
                y: 0,
                blur: 10,
                spread: 0
            )
        }
        
        countLabel.do {
            $0.text = "3번"
            $0.textColor = .white
            $0.font = .body3
            $0.backgroundColor = .black
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 12
        }
        
        postponeLabel.do {
            $0.text = "알람 미루기"
            $0.textColor = .black
            $0.font = .body1
        }
        
        var configuration = UIButton.Configuration.filled()
        configuration.title = "알람 끄기"
        configuration.titleAlignment = .center
        configuration.attributedTitle?.font = UIFont.title5
        configuration.baseBackgroundColor = UIColor.appColor(.redPrimary)
        
        offButton.do {
            $0.configuration = configuration
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 8)
            $0.layer.addShadow(
                color: .black,
                alpha: 0.25,
                x: 0,
                y: 0,
                blur: 10,
                spread: 0
            )
        }
    }
    
    func setHierarchy() {
        self.addSubViews(
            backgroundImageView,
            dateLabel,
            timeLabel,
            postponeView,
            offButton
        )
        postponeView.addSubViews(countLabel, postponeLabel)
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(101)
            $0.centerX.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        postponeView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom).offset(157)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(142)
            $0.height.equalTo(50)
        }
        
        countLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.width.equalTo(32)
            $0.height.equalTo(24)
            
        }
        
        postponeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(countLabel.snp.trailing).offset(12)
        }
        
        offButton.snp.makeConstraints {
            $0.top.equalTo(postponeView.snp.bottom).offset(200)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(64)
            $0.width.equalTo(314)
        }
    }
}

/// label에 패딩을 주기 위한 base class
class CountBaseLabel: UILabel {
    private var padding = UIEdgeInsets(top: 3, left: 7, bottom: 3, right: 7)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
}
