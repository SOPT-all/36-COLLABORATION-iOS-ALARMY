//
//  MornigMoodView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import UIKit

final class MorningMoodView: UIView {
    
    // MARK: - Properties
    private let titleLabel = UILabel()
    private let faceIcon = UIImageView()
    private let morningMoodRightIcon = UIImageView()
    
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
extension MorningMoodView: ViewConfigurable {
    func setStyle() {
        self.makeBorder(width: 0, color: .clear, cornerRadius: 15)
        self.backgroundColor = UIColor.appColor(.greyOpacity900)
        
        titleLabel.do {
            $0.text = "아침 기분"
            $0.font = .body1
            $0.textColor = .white
        }
        
        faceIcon.do {
            $0.image = .iconMorningMood
        }
        
        morningMoodRightIcon.do {
            $0.image = .iconHomeArrow
            $0.tintColor = UIColor.appColor(.grey400)
        }
    }
    
    func setHierarchy() {
        self.addSubViews(titleLabel, faceIcon, morningMoodRightIcon)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(23)
        }
        
        morningMoodRightIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(19)
        }
        
        faceIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(morningMoodRightIcon.snp.leading).offset(-14)
        }
    }
}
