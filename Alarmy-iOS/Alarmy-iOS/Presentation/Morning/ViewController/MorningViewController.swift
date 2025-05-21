//
//  MorningViewController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

final class MorningViewController: UIViewController {
    
    private var weather: WeatherEntity?
    private let service: MorningProtocol = DefaultMorningService()

    private let rootView = MorningView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather()
    }
    
}

extension MorningViewController {
    private func fetchWeather() {
        Task {
            weather = try await service.fetchWeather()
            guard let weather else { return }
            rootView.informationView.dataBind(weather)
        }
    }
}
