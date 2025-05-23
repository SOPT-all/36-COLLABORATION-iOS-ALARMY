//
//  AlarmViewController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

import SnapKit
import Then

final class AlarmViewController: UIViewController {
    
    // MARK: - Properties
    private var isDimmed: Bool = false
    private var gradient = CAGradientLayer()
    private var alarmCheckTimer: Timer?
    private let offAlarmView = OffAlarmView()
    
    // MARK: - UI Properties
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let homeHeaderButton = UIButton()
    private let nextAlarmButton = UIButton()
    private let timeAlarmLabel = UILabel()
    private let alarmCollectionView = AlarmCollectionView()
    
    private let plusButton = UIButton()
    private let dimView = UIView()
    private let alarmButtonStackView = UIStackView()
    private let clockButton = AlarmCircleButton(
        title: "알람",
        image: .iconFloatingClock
    )
    private let medButton = AlarmCircleButton(
        title: "약 알람",
        image: .iconFloatingMed
    )
    private let quickButton = AlarmCircleButton(
        title: "퀵 알람",
        image: .iconFloatingQuick
    )
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        fetchAlarmList()
        startAlarmCheckTimer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.updateCollectionViewHeight()
        }
        setGradient()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        alarmCheckTimer?.invalidate()
    }
}

extension AlarmViewController {
    // MARK: - UI Function
    private func updateCollectionViewHeight() {
        let totalHeight = alarmCollectionView.calculatedAlarmCollectionViewHeight()
        
        alarmCollectionView.snp.updateConstraints {
            $0.height.equalTo(totalHeight)
        }
        
        contentView.snp.updateConstraints {
            $0.bottom.equalTo(alarmCollectionView.snp.bottom).offset(40)
        }
    }
    
    private func setGradient() {
        let colors: [CGColor] = [
            .init(red: 19/255, green: 20/255, blue: 24/255, alpha: 0.9),
            .init(red: 19/255, green: 20/255, blue: 24/255, alpha: 0)
        ]
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        gradient.frame = dimView.bounds
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor.appColor(.grey950)
        
        homeHeaderButton.do {
            $0.setImage(.iconHeaderMenu, for: .normal)
        }
        
        nextAlarmButton.do {
            var config = UIButton.Configuration.filled()
            let title = "다음 알람"
            
            let attributedTitle = AttributedString(title, attributes: AttributeContainer([
                .font: UIFont.body4,
                .foregroundColor: UIColor.white
            ]))
            
            config.attributedTitle = attributedTitle
            config.image = .iconHomeArrow
            config.baseBackgroundColor = UIColor.appColor(.grey900)
            config.imagePlacement = .trailing
            config.imagePadding = 4
            config.cornerStyle = .capsule
            config.contentInsets = .zero
            
            $0.configuration = config
        }
        
        timeAlarmLabel.do {
            $0.text = "9시간 22분 후에 울려요"
            $0.textColor = UIColor.appColor(.grey100)
            $0.font = .title5
        }
        
        plusButton.do {
            var config = UIButton.Configuration.filled()
            
            config.image = .iconFloatingPlus
            config.baseBackgroundColor = UIColor.appColor(.redPrimary)
            config.imagePadding = 12
            config.contentInsets = .zero
            config.cornerStyle = .capsule
            
            $0.configuration = config
            $0.addTarget(self, action: #selector(plustButtonTapped), for: .touchUpInside)
        }
        
        dimView.do {
            $0.layer.addSublayer(gradient)
            $0.isUserInteractionEnabled = false
            $0.layer.opacity = 0
        }
        
        alarmButtonStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.isHidden = true
        }
        
        clockButton.do {
            $0.button.addTarget(self, action: #selector(clockButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setHierarchy() {
        view.addSubViews(
            scrollView,
            dimView,
            plusButton,
            alarmButtonStackView
        )
        
        scrollView.addSubview(contentView)
        
        contentView.addSubViews(
            homeHeaderButton,
            nextAlarmButton,
            timeAlarmLabel,
            alarmCollectionView
        )
        
        alarmButtonStackView.addArrangedSubViews(
            clockButton,
            medButton,
            quickButton
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.bottom.equalTo(alarmCollectionView.snp.bottom).offset(40)
            $0.width.equalToSuperview()
        }
        
        homeHeaderButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(32)
        }
        
        nextAlarmButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(homeHeaderButton.snp.bottom).offset(16)
            $0.width.greaterThanOrEqualTo(76)
            $0.height.equalTo(30)
        }
        
        timeAlarmLabel.snp.makeConstraints {
            $0.leading.equalTo(nextAlarmButton.snp.leading).offset(8)
            $0.top.equalTo(nextAlarmButton.snp.bottom).offset(16)
        }
        
        alarmCollectionView.snp.remakeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-14)
            $0.top.equalTo(timeAlarmLabel.snp.bottom).offset(32)
            $0.height.equalTo(1)
        }
        
        dimView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(52)
        }
        
        alarmButtonStackView.snp.makeConstraints {
            $0.bottom.equalTo(plusButton.snp.top).offset(-12)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

// MARK: - objc
extension AlarmViewController {
    @objc
    private func plustButtonTapped() {
        if isDimmed {
            UIView.animate(withDuration: 0.4) {
                self.plusButton.transform = .identity
                self.dimView.layer.opacity = 0
            }
            
            for (index, button) in alarmButtonStackView.arrangedSubviews.enumerated().reversed() {
                UIView.animate(withDuration: 0.4, delay: Double(index) * 0.1, animations: {
                    button.alpha = 0
                    button.transform = CGAffineTransform(translationX: 0, y: 20)
                }) { _ in
                    self.alarmButtonStackView.isHidden = true
                }
            }
        } else {
            UIView.animate(withDuration: 0.4) {
                self.plusButton.transform = CGAffineTransform(rotationAngle: .pi/4)
                self.dimView.layer.opacity = 1
            }
            
            alarmButtonStackView.isHidden = false
            for (index, button) in alarmButtonStackView.arrangedSubviews.enumerated() {
                button.alpha = 0
                button.transform = CGAffineTransform(translationX: 0, y: 20)
                
                UIView.animate(withDuration: 0.5, delay: Double(index) * 0.1) {
                    button.alpha = 1
                    button.transform = .identity
                }
            }
        }
        
        isDimmed.toggle()
    }
    
    @objc
    private func clockButtonTapped() {
        let viewController = AlarmSettingViewController()
        viewController.modalPresentationStyle = .fullScreen
        
        present(viewController, animated: true)
    }
}

// MARK: - Network
extension AlarmViewController {
    private func fetchAlarmList() {
        Task {
            let data = try await DefaultFetchAlarmService().fetchAlarmList()
            alarmCollectionView.updateData(with: data)
            updateCollectionViewHeight()
        }
    }
    
    private func startAlarmCheckTimer() {
        alarmCheckTimer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { [weak self] _ in
            self?.checkAlarmShouldTrigger()
        }
    }
    
    private func checkAlarmShouldTrigger() {
        let currentTime = generateCurrentTimeString()
        let service = DefaultAlarmCheckService()
        
        Task {
            do {
                let triggeredIDs = try await service.fetchAlarmCheck(currentTime: currentTime)
                let currentList = alarmCollectionView.getCurrentData()
                
                let updatedList = currentList.map { alarm in
                    var newAlarm = alarm
                    newAlarm.isActive = triggeredIDs.contains(alarm.id)
                    return newAlarm
                }
                
                if updatedList.contains(where: { $0.isActive }) {
                    showOffAlarmView()
                }
                
                alarmCollectionView.updateData(with: updatedList)
                updateCollectionViewHeight()
            } catch {
                print("알람 체크 실패: \(error)")
            }
        }
    }
    
    private func showOffAlarmView() {
        guard offAlarmView.superview == nil else { return }

        offAlarmView.alpha = 0
        offAlarmView.onDismiss = { [weak self] in
            guard let self = self else { return }

            self.offAlarmView.removeFromSuperview()

            if let tabBarController = self.tabBarController as? AlarmyTabBarController {
                tabBarController.selectedIndex = TabIndex.morning.rawValue
            }
        }

        view.addSubview(offAlarmView)
        offAlarmView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        UIView.animate(withDuration: 0.3) {
            self.offAlarmView.alpha = 1
        }
    }
    
    private func generateCurrentTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: Date())
    }
}
