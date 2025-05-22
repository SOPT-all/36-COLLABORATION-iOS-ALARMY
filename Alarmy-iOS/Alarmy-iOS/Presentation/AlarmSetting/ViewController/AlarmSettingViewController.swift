//
//  AlarmSettingViewController.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/14/25.
//

import UIKit

import SnapKit
import Then

protocol AlarmSettingViewControllerDelegate: AnyObject {
    func alarmSettingViewControllerDidDismiss()
}

final class AlarmSettingViewController: UIViewController {
    // MARK: - Properties
    private let service: AlarmSettingProtocol = AlarmSettingService()
    weak var delegate: AlarmSettingViewControllerDelegate?
    
    // MARK: - UI Properties
    private let rootView = AlarmSettingView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .appColor(.grey900)
        
        setAddTarget()
    }
}

extension AlarmSettingViewController {
    func setAddTarget() {
        self.rootView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        self.rootView.headerView.xButton.addTarget(self, action: #selector(xButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func xButtonTapped() {
        delegate?.alarmSettingViewControllerDidDismiss()
        self.dismiss(animated: true)
    }
}

// MARK: - Network
extension AlarmSettingViewController {
    @objc
    private func saveButtonTapped() {
        Task {
            await createAlarm()
            delegate?.alarmSettingViewControllerDidDismiss()
            self.dismiss(animated: true)
        }
    }
    
    private func createAlarm() async {
        do {
            guard let timestamp = rootView.timeAndDaySettingView.timestamp else { return }
            try await service.createAlarm(timestamp: timestamp)
        } catch {
            print("알람 생성 실패: \(error)")
        }
    }
}
