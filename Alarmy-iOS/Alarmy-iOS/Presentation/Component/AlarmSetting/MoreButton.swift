//
//  MoreButton.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/16/25.
//

import UIKit

import SnapKit
import Then

final class MoreButton: UIButton {
    
    // MARK: - UI Properties
    private let moreButtonImageView = UIImageView()
    
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
    
    // MARK: - UI Function
    private func setStyle() {
        
        moreButtonImageView.do {
            $0.image = .btnSettingMore
        }
    }
    
    private func setHierarchy() {
        self.addSubview(moreButtonImageView)
    }
    
    private func setLayout() {
        moreButtonImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(5)
            $0.height.equalTo(10)
        }
        self.snp.makeConstraints {
            $0.width.height.equalTo(16)
        }
    }
    
    // MARK: - Function
    
}
