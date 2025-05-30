//
//  SectionDivider.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/15/25.
//

import UIKit

import SnapKit
import Then

final class SectionDivider: UIView {
    
    // MARK: - UI Properties
    private let dividerView = UIView()
    
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
        dividerView.do {
            $0.backgroundColor = .appColor(.grey950)
        }
    }
    
    private func setLayout() {
        dividerView.snp.makeConstraints {
            $0.width.equalTo(snp.width)
            $0.height.equalTo(8)
        }
    }
    
    private func setHierarchy() {
        self.addSubview(dividerView)
    }
    
    // MARK: - Function

}
