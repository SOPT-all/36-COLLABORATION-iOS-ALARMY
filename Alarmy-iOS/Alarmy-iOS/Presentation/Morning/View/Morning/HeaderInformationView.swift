//
//  HeaderInformationView.swift
//  Alarmy-iOS
//
//  Created by 최주리 on 5/14/25.
//

import UIKit

class HeaderInformationView: UIView {
    
    // MARK: - Properties
    private let informationStackView = UIStackView()
    
    private let dateLabel = UILabel()
    
    private let temperatureView = UIView()
    private let temperatureLabel = UILabel()
    private let weatherImageView = UIImageView()
    private let weatherRightIcon = UIImageView()
    
    private let regionLabel = UILabel()
    
    private let locationView = UIView()
    private let locationIcon = UIImageView()
    private let locationLabel = UILabel()

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

// MARK: - Functions
extension HeaderInformationView {
    func dataBind(_ weather: WeatherEntity) {
        temperatureLabel.text = "\(weather.temperature)°C"
        weatherImageView.image = UIImage(resource: WeatherIcon.codeToImage(weather.code))
    }
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "M월 dd일 (E)"
        
        let current = dateFormatter.string(from: Date())
        return current
    }
}

// MARK: - ViewConfigurable protocol
extension HeaderInformationView: ViewConfigurable {
    func setStyle() {
        informationStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.alignment = .center
        }
        
        dateLabel.do {
            $0.text = getDate()
            $0.font = .title10
            $0.textColor = .white
        }
        
        temperatureLabel.do {
            $0.font = .title2
            $0.textColor = .white
        }
        
        weatherImageView.do {
            $0.image = .iconMorningCloud
        }
        
        weatherRightIcon.do {
            $0.image = .iconHomeArrow
            $0.tintColor = .white
        }
        
        regionLabel.do {
            $0.text = "Seoul"
            $0.font = .body7
            $0.textColor = .white
        }
        
        locationView.do {
            $0.makeBorder(width: 0, color: .clear, cornerRadius: 15)
            $0.backgroundColor = UIColor.appColor(.greyOpacity900)
        }
        
        locationIcon.do {
            $0.image = .iconLocation
        }
        
        locationLabel.do {
            $0.text = "정확한 위치: 꺼짐"
            $0.font = .body3
            $0.textColor = .white
        }
    }
    
    func setHierarchy() {
        self.addSubview(informationStackView)
        informationStackView.addArrangedSubViews(
            dateLabel,
            temperatureView,
            regionLabel,
            locationView
        )
        
        temperatureView.addSubViews(
            temperatureLabel,
            weatherImageView,
            weatherRightIcon
        )
        
        locationView.addSubViews(locationIcon, locationLabel)
    }
    
    func setLayout() {
        informationStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(4)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        weatherRightIcon.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(12)
            $0.leading.equalTo(weatherImageView.snp.trailing)
        }
        
        locationView.snp.makeConstraints {
            $0.width.equalTo(121)
            $0.height.equalTo(30)
        }
        
        locationIcon.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(locationIcon.snp.trailing).offset(7)
        }
    }
}
