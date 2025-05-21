//
//  MorningView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class MorningView: UIView {
    
    // MARK: - Properties
    private let backgroundImageView = UIImageView()
    
    let informationView = HeaderInformationView()
    
    private let contentStackView = UIStackView()
    let todaySentenceView = TodaySentenceView()
    private let morningMoodView = MorningMoodView()
    private let stellaView = StellaView()
     
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

//MARK: - ViewConfigurable protocol
extension MorningView: ViewConfigurable {
    func setStyle() {
        backgroundImageView.do {
            $0.image = .morningBackground
        }
        
        contentStackView.do {
            $0.axis = .vertical
            $0.spacing = 16
        }
    }
    
    func setHierarchy() {
        self.addSubViews(
            backgroundImageView,
            informationView,
            contentStackView
        )
        
        contentStackView.addArrangedSubViews(
            todaySentenceView,
            morningMoodView,
            stellaView
        )
    }
    
    func setLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        informationView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(60)
            $0.height.equalTo(202)
        }
        
        contentStackView.snp.makeConstraints {
            $0.top.equalTo(informationView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        
        todaySentenceView.snp.makeConstraints {
            $0.height.equalTo(208)
        }
        
        morningMoodView.snp.makeConstraints {
            $0.height.equalTo(72)
        }
        
        stellaView.snp.makeConstraints {
            $0.height.equalTo(104)
        }
    }
}
