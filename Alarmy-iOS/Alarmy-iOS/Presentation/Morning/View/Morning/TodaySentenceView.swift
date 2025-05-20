//
//  TodaySentenceView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class TodaySentenceView: UIView {
    
    // MARK: - Properties
    private let todayLabel = UILabel()
    private let shareButton = UIButton()
    private let todayImageView = UIImageView()

    //MARK: - Initializer
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
extension TodaySentenceView: ViewConfigurable {
    func setStyle() {
        self.makeBorder(width: 0, color: .clear, cornerRadius: 15)
        self.backgroundColor = UIColor.appColor(.greyOpacity900)
        
        todayLabel.do {
            $0.text = "오늘의 문장"
            $0.font = .body1
            $0.textColor = .white
        }
        var configuration = UIButton.Configuration.borderedTinted()
        configuration.title = "공유하기"
        configuration.titleAlignment = .center
        configuration.attributedTitle?.font = UIFont.body3
        configuration.baseForegroundColor = .white
        
        configuration.baseBackgroundColor = UIColor.clear

        
        shareButton.do {
            $0.configuration = configuration
            $0.makeBorder(width: 1, color: .white, cornerRadius: 5)
        }
        
        todayImageView.do {
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 16)
        }
    }
    
    func setHierarchy() {
        self.addSubViews(todayLabel, shareButton, todayImageView)
    }
    
    func setLayout() {
        todayLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(19)
            $0.leading.equalToSuperview().inset(20)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(17)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        todayImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
