//
//  MorningViewController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

final class MorningViewController: UIViewController {
    // MARK: - Properties
    private var weather: WeatherEntity?
    private var imageNumber: Int?
    private let service: MorningProtocol = DefaultMorningService()

    // MARK: - UIProperties
    private let rootView = MorningView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchWeather()
        fetchQuote()
    }
}

// MARK: - Network
extension MorningViewController {
    private func fetchWeather() {
        Task {
            weather = try await service.fetchWeather()
            guard let weather else { return }
            
            rootView.informationView.dataBind(weather)
        }
    }
    
    private func fetchQuote() {
        Task {
            imageNumber = try await service.fetchQuote()
            guard let imageNumber else { return }
            
            rootView.todaySentenceView.bindImage(imageNumber)
        }
    }
}
