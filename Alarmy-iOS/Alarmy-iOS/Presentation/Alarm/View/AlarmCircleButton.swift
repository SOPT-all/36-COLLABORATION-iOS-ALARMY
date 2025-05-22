//
//  AlarmCircleButton.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/20/25.
//

import UIKit

final class AlarmCircleButton: UIView {
    
    // MARK: - Properties
    private var config = UIButton.Configuration.filled()
    let title: String
    let image: UIImage
    
    // MARK: - UIProperties
    let button = UIButton()
    private let titleLabel = TitleBaseLabel()
    
    init(
        title: String,
        image: UIImage
    ) {
        self.title = title
        self.image = image
        
        super.init(frame: .zero)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlarmCircleButton: ViewConfigurable {
    func setStyle() {
        config.image = image
        config.baseBackgroundColor = UIColor.appColor(.white)
        config.imagePadding = 10
        config.contentInsets = .zero
        config.cornerStyle = .capsule
        
        button.do {
            $0.configuration = config
        }
        
        titleLabel.do {
            $0.text = title
            $0.font = .body1
            $0.textColor = .black
            $0.backgroundColor = .white
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 5)
        }
    }
    
    func setHierarchy() {
        addSubViews(titleLabel, button)
    }
    
    func setLayout() {
        button.snp.makeConstraints {
            $0.size.equalTo(48)
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.trailing.equalTo(button.snp.leading).offset(-8)
            $0.centerY.equalToSuperview()
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
    }
}

final class TitleBaseLabel: UILabel {
    private var padding = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
    
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
