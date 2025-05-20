//
//  StellaView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import UIKit

final class StellaView: UIView {
    
    // MARK: - Properties
    private let stackView = UIStackView()
    private let stellaTitleLabel = UILabel()
    private let stellaRightIcon = UIImageView()
    private let stellasubTitleLabel = UILabel()
    private let stellaContentLabel = UILabel()
    
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
extension StellaView: ViewConfigurable {
    func setStyle() {
        self.makeBorder(width: 0, color: .clear, cornerRadius: 15)
        self.backgroundColor = UIColor.appColor(.greyOpacity900)
        
        stackView.do {
            $0.axis = .vertical
            $0.spacing = 9
        }
        
        stellaTitleLabel.do {
            $0.text = "별자리 운세"
            $0.font = .body1
            $0.textColor = .white
        }
        
        stellaRightIcon.do {
            $0.image = .iconHomeArrow
            $0.tintColor = UIColor.appColor(.grey400)
        }
        
        stellasubTitleLabel.do {
            $0.text = "별자리로 알아보는 오늘 나의 하루!"
            $0.font = .body5
            $0.textColor = .white
        }
        
        stellaContentLabel.do {
            $0.text = "당신의 생일을 알려주세요"
            $0.font = .caption1
            $0.textColor = UIColor.appColor(.grey400)
        }
        
    }
    
    func setHierarchy() {
        self.addSubViews(stackView, stellaRightIcon)
        stackView.addArrangedSubViews(
            stellaTitleLabel,
            stellasubTitleLabel,
            stellaContentLabel
        )
    }
    
    func setLayout() {
        stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(22)
        }
        
        stellaRightIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview().inset(22)
        }
    }
}
