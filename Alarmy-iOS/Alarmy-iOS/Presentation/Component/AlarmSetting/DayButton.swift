//
//  DayButton.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/14/25.
//

import UIKit

import SnapKit
import Then

class DayButton: UIButton {
    // MARK: - Properties
    
    // MARK: - UI Properties
    private let circleView = UIView()
    private let label = UILabel()
    
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
        circleView.do {
            $0.backgroundColor = .appColor(.bluePrimaryOpacity)
            $0.layer.borderColor = UIColor.appColor(.bluePrimary).cgColor
            $0.layer.borderWidth = 2
            $0.layer.cornerRadius = 15
        }
        
        label.do {
            $0.text = "일"
            $0.textColor = .appColor(.bluePrimary)
            $0.font = .body2
        }
    }
    
    private func setLayout() {
        circleView.snp.makeConstraints {
            $0.width.height.equalTo(31)
        }
        
        label.snp.makeConstraints {
            $0.center.equalTo(circleView.snp.center)
        }
        
    }
    
    private func setHierarchy() {
        self.addSubview(circleView)
        circleView.addSubview(label)
    }
    
    // MARK: - Function
    func setDay(_ text: String) {
        label.text = text
    }
}
