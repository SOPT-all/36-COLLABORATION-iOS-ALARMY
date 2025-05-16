//
//  AlarmSettingViewController.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/14/25.
//

import UIKit

import SnapKit
import Then

final class AlarmSettingViewController: UIViewController {
    // MARK: - Properties
    private var isVibrationOn: Bool = false {
        didSet {
            updateVibrationButtonState()
        }
    }
    
    private var lastSnapValue: Float = -1
    
    // MARK: - UI Properties
    private let xButton = UIButton()
    private let timeUntilAlarmLabel = UILabel()
    private let headerStackView = UIStackView()
    private let headerBackgroundView = UIView()
    
    private let alarmSettingScrollView = UIScrollView()
    private let alarmSettingScrollContentView = UIView()
    
    private lazy var timePicker = UIDatePicker()
    
    private let selectedDayLabel = UILabel()
    private let everyDayCheckButton = UIButton()
    private let everyDayCheckLabel = UILabel()
    private let everyDayCheckStackView = UIStackView()
    private let selectDayStackView = UIStackView()
    
    private let sunButton = DayButton()
    private let monButton = DayButton()
    private let tueButton = DayButton()
    private let wedButton = DayButton()
    private let thuButton = DayButton()
    private let friButton = DayButton()
    private let satButton = DayButton()
    private let selectDayButtonStackView = UIStackView()
    
    private let divider1 = SectionDivider()
    
    private let missionLabel = UILabel()
    private let missionCountLabel = UILabel()
    private let missionLabelStackView = UIStackView()
    private let missionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let missionStackView = UIStackView()
    
    private let divider2 = SectionDivider()
    
    private let minimumVolumeImageView = UIImageView()
    private let volumeSlider = UISlider()
    private let maximumVolumeImageView = UIImageView()
    private let verticalDivider = UIView()
    private let vibrationButton = UIButton()
    private let volumeAndVibrationStackView = UIStackView()
    
    private let soundLabel = UILabel()
    private let cheerfulMorningLabel = UILabel()
    private let soundMoreButton = MoreButton()
    private let soundMoreStackView = UIStackView()
    private let soundStackView = UIStackView()
    
    private let soundPowerUpLabel = UILabel()
    private let soundPowerUpCountLabel = UILabel()
    private let soundPowerUpMoreButton = MoreButton()
    private let soundPowerUpMoreStackView = UIStackView()
    private let soundPowerUpStackView = UIStackView()
    
    private let divider3 = SectionDivider()
    
    private let delayAlarmLabel = UILabel()
    private let delayInfoLabel = UILabel()
    private let delayAlarmMoreButton = MoreButton()
    private let delayAlarmMoreStackView = UIStackView()
    private let delayAlarmStackView = UIStackView()
    
    private let memoLabel = UILabel()
    private let memoTextView = UILabel()
    private let memoMoreButton = MoreButton()
    private let memoMoreStackView = UIStackView()
    private let memoStackView = UIStackView()
    
    private let preventSleepLabel = UILabel()
    private let lockImageView = UIImageView()
    private let preventSleepLabelStackView = UIStackView()
    private let preventSleepMoreButton = MoreButton()
    private let preventSleepStackView = UIStackView()
    
    private let saveButton = UIButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setStyle()
        setHierarchy()
        setLayout()
        register()
        setDelegate()
        setCollectionviewLayout()
        setAddTarget()
    }
    // MARK: - UI Function
    private func setStyle() {
        view.backgroundColor = .appColor(.grey900)
        
        xButton.do {
            $0.setImage(.icnSettingClose, for: .normal)
            $0.tintColor = .appColor(.white)
        }
        
        timeUntilAlarmLabel.do {
            $0.text = "8시간 33분 후에 울려요"
            $0.textColor = .appColor(.white)
            $0.font = .body2
        }
        
        headerStackView.do {
            [xButton, timeUntilAlarmLabel].forEach {
                headerStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 82
            $0.alignment = .center
            $0.distribution = .fillProportionally
        }
        
        headerBackgroundView.do {
            $0.backgroundColor = .appColor(.grey900)
        }
        
        alarmSettingScrollView.do {
            $0.isScrollEnabled = true
        }
        
        timePicker.do {
            $0.preferredDatePickerStyle = .wheels
            $0.datePickerMode = .time
            $0.minuteInterval = 1
            $0.locale = Locale(identifier: "ko_KR")
            $0.tintColor = .appColor(.white)
            $0.setValue(UIColor.white, forKeyPath: "textColor")
        }
        
        selectedDayLabel.do {
            $0.text = "일, 월, 화, 수, 목, 금, 토"
            $0.textColor = .appColor(.white)
            $0.font = .body1
        }
        
        everyDayCheckButton.do {
            $0.setImage(.btnSettingCheckbox, for: .normal)
        }
        
        everyDayCheckLabel.do {
            $0.text = "매일"
            $0.textColor = .appColor(.white)
            $0.font = .body5
        }
        
        everyDayCheckStackView.do {
            [everyDayCheckButton, everyDayCheckLabel].forEach {
                everyDayCheckStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fillProportionally
        }
        
        selectDayStackView.do {
            [selectedDayLabel, everyDayCheckStackView].forEach {
                selectDayStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        sunButton.do {
            $0.setDay("일")
        }
        
        monButton.do {
            $0.setDay("월")
        }
        
        tueButton.do {
            $0.setDay("화")
        }
        
        wedButton.do {
            $0.setDay("수")
        }
        
        thuButton.do {
            $0.setDay("목")
        }
        
        friButton.do {
            $0.setDay("금")
        }
        
        satButton.do {
            $0.setDay("토")
        }
        
        selectDayButtonStackView.do {
            [sunButton, monButton, tueButton, wedButton, thuButton, friButton, satButton].forEach {
                selectDayButtonStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        missionLabel.do {
            $0.text = "미션"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        missionCountLabel.do {
            $0.text = "0/5"
            $0.textColor = .appColor(.grey300)
            $0.font = .body7
        }
        
        missionLabelStackView.do {
            [missionLabel, missionCountLabel].forEach {
                missionLabelStackView.addArrangedSubview($0)
            }
            $0.axis = .vertical
            $0.spacing = 2
            $0.distribution = .fillEqually
            $0.alignment = .center
        }
        
        missionStackView.do {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.distribution = .equalSpacing
            $0.alignment = .center
        }
        
        missionCollectionView.do {
            $0.backgroundColor = .clear
            $0.touchesShouldCancel(in: $0)
            $0.showsHorizontalScrollIndicator = false
        }
        
        minimumVolumeImageView.do {
            $0.image = .icnSettingSoundOff
        }
        
        volumeSlider.do {
            $0.minimumValue = 0
            $0.maximumValue = 100
            $0.isContinuous = true
            $0.tintColor = .appColor(.bluePrimary)
            $0.setThumbImage(.icnSettingSliderThumb, for: .normal)
        }
        
        maximumVolumeImageView.do {
            $0.image = .icnSettingSoundOn
        }
        
        verticalDivider.do {
            $0.backgroundColor = .appColor(.grey700)
        }
        
        vibrationButton.do {
            $0.setImage(.btnSettingVibrationFalse, for: .normal)
            $0.setImage(.btnSettingVibrationTrue, for: .selected)
        }
        
        volumeAndVibrationStackView.do {
            [minimumVolumeImageView, volumeSlider, maximumVolumeImageView, verticalDivider, vibrationButton].forEach {
                volumeAndVibrationStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        soundLabel.do {
            $0.text = "사운드"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        cheerfulMorningLabel.do {
            $0.text = "활기찬 아침"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        soundMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        soundMoreStackView.do {
            [cheerfulMorningLabel, soundMoreButton].forEach {
                soundMoreStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        soundStackView.do {
            [soundLabel, soundMoreStackView].forEach {
                soundStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        soundPowerUpLabel.do {
            $0.text = "사운드 파워업"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        soundPowerUpCountLabel.do {
            $0.text = "1개 사용"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        soundPowerUpMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        soundPowerUpMoreStackView.do {
            [soundPowerUpCountLabel, soundPowerUpMoreButton].forEach {
                soundPowerUpMoreStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        soundPowerUpStackView.do {
            [soundPowerUpLabel, soundPowerUpMoreStackView].forEach {
                soundPowerUpStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        delayAlarmLabel.do {
            $0.text = "알람 미루기"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        delayInfoLabel.do {
            $0.text = "5분, 3회"
            $0.textColor = .appColor(.grey100)
            $0.font = .body6
        }
        
        delayAlarmMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        delayAlarmMoreStackView.do {
            [delayInfoLabel, delayAlarmMoreButton].forEach {
                delayAlarmMoreStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        delayAlarmStackView.do {
            [delayAlarmLabel, delayAlarmMoreStackView].forEach {
                delayAlarmStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        memoLabel.do {
            $0.text = "메모"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        memoTextView.do {
            $0.text = "메모 없음"
            $0.textColor = .appColor(.grey500)
            $0.font = .body6
        }
        
        memoMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        memoMoreStackView.do {
            [memoTextView, memoMoreButton].forEach {
                memoMoreStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 4
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        memoStackView.do {
            [memoLabel, memoMoreStackView].forEach {
                memoStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        preventSleepLabel.do {
            $0.text = "다시 잠들기 방지"
            $0.textColor = .appColor(.grey100)
            $0.font = .body1
        }
        
        lockImageView.do {
            $0.image = .icnSettingLock
        }
        
        preventSleepLabelStackView.do {
            [preventSleepLabel, lockImageView].forEach {
                preventSleepLabelStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 8
            $0.distribution = .fill
            $0.alignment = .center
        }
        
        preventSleepMoreButton.do {
            $0.tintColor = .appColor(.grey500)
        }
        
        preventSleepStackView.do {
            [preventSleepLabelStackView, preventSleepMoreButton].forEach {
                preventSleepStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
        }
        
        saveButton.do {
            $0.setTitle("저장", for: .normal)
            $0.titleLabel?.font = .body1
            $0.backgroundColor = .appColor(.redPrimary)
            $0.layer.cornerRadius = 8
        }
    }
    
    private func setHierarchy() {
        view.addSubview(headerBackgroundView)
        view.addSubview(headerStackView)
        view.addSubview(alarmSettingScrollView)
        alarmSettingScrollView.addSubview(alarmSettingScrollContentView)
        view.addSubview(saveButton)
        
        [timePicker, selectDayStackView, selectDayButtonStackView, divider1, missionLabelStackView, missionCollectionView, divider2, volumeAndVibrationStackView, soundStackView, soundPowerUpStackView, divider3, delayAlarmStackView, memoStackView, preventSleepStackView].forEach {
            alarmSettingScrollContentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        headerBackgroundView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(62)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(headerStackView.snp.bottom).offset(15)
        }
        
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(62)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        alarmSettingScrollView.snp.makeConstraints {
            $0.top.equalTo(headerBackgroundView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        alarmSettingScrollContentView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(alarmSettingScrollView.contentLayoutGuide)
            $0.width.equalTo(alarmSettingScrollView.snp.width)
        }
        
        timePicker.snp.makeConstraints {
            $0.top.equalTo(alarmSettingScrollContentView.snp.top).offset(15)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
            $0.height.equalTo(160)
        }
        
        selectDayStackView.snp.makeConstraints {
            $0.top.equalTo(timePicker.snp.bottom).offset(30)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        selectDayButtonStackView.snp.makeConstraints {
            $0.top.equalTo(selectDayStackView.snp.bottom).offset(24)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(selectDayButtonStackView.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        missionLabelStackView.snp.makeConstraints {
            $0.top.equalTo(selectDayButtonStackView.snp.bottom).offset(58.5)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
        }
        
        missionCollectionView.snp.makeConstraints {
            $0.top.equalTo(selectDayButtonStackView.snp.bottom).offset(48)
            $0.leading.equalTo(missionLabelStackView.snp.trailing).offset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
            $0.height.equalTo(68)
        }
        
        // TODO: StackView로 맞추기 .. 시도하기
//        missionStackView.snp.makeConstraints {
//            $0.top.equalTo(divider1.snp.bottom).offset(20)
//            $0.height.equalTo(68)
//        }
        
        divider2.snp.makeConstraints {
            $0.top.equalTo(missionCollectionView.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        minimumVolumeImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        volumeSlider.snp.makeConstraints {
            $0.width.equalTo(227)
        }
        
        maximumVolumeImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        
        verticalDivider.snp.makeConstraints {
            $0.width.equalTo(0.5)
            $0.height.equalTo(24)
        }
        
        volumeAndVibrationStackView.snp.makeConstraints {
            $0.top.equalTo(missionCollectionView.snp.bottom).offset(48)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        soundStackView.snp.makeConstraints {
            $0.top.equalTo(volumeAndVibrationStackView.snp.bottom).offset(24)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        soundPowerUpStackView.snp.makeConstraints {
            $0.top.equalTo(soundStackView.snp.bottom).offset(32)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        divider3.snp.makeConstraints {
            $0.top.equalTo(soundPowerUpStackView.snp.bottom).offset(20)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing)
        }
        
        delayAlarmStackView.snp.makeConstraints {
            $0.top.equalTo(soundPowerUpStackView.snp.bottom).offset(48)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        memoStackView.snp.makeConstraints {
            $0.top.equalTo(delayAlarmStackView.snp.bottom).offset(32)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
        }
        
        lockImageView.snp.makeConstraints {
            $0.width.equalTo(12)
            $0.height.equalTo(13)
        }
        
        preventSleepStackView.snp.makeConstraints {
            $0.top.equalTo(memoStackView.snp.bottom).offset(32)
            $0.leading.equalTo(alarmSettingScrollContentView.snp.leading).inset(20)
            $0.trailing.equalTo(alarmSettingScrollContentView.snp.trailing).inset(20)
            $0.bottom.equalToSuperview().inset(127)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview().inset(41)
        }
        
    }
    
    private func setCollectionviewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        missionCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    // MARK: - Function
    
    private func setAddTarget() {
        vibrationButton.addTarget(self, action: #selector(vibrationButtonTapped), for: .touchUpInside)
        volumeSlider.addTarget(self, action: #selector(volumeSliderChanged(_:)), for: .valueChanged)

    }
    
    private func register() {
        missionCollectionView.register(
            MissionCollectionViewCell.self,
            forCellWithReuseIdentifier: MissionCollectionViewCell.identifier
        )
    }
    
    private func setDelegate() {
        missionCollectionView.delegate = self
        missionCollectionView.dataSource = self
    }
    
    private func updateVibrationButtonState() {
        vibrationButton.isSelected = isVibrationOn
    }
    
    // MARK: - objc
    @objc
    private func vibrationButtonTapped() {
        isVibrationOn.toggle()
    }
    
    @objc
    private func volumeSliderChanged(_ sender: UISlider) {
        let snapStep: Float = 10
        let newValue = round(sender.value / snapStep) * snapStep
        sender.setValue(newValue, animated: false)
        
        if newValue != lastSnapValue {
            lastSnapValue = newValue
        }
    }
}

// MARK: - Extension

extension AlarmSettingViewController: UICollectionViewDelegate {
    
}

extension AlarmSettingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: - 미션 개수로 바꾸야하는디 ....
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MissionCollectionViewCell.identifier, for: indexPath) as? MissionCollectionViewCell else { return UICollectionViewCell() }
        cell.setImage(index: indexPath.item)
        return cell
    }
}

extension AlarmSettingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 68, height: 68)
    }
    
    private func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                                minimumLineSpacingForSectionAt section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}


#Preview {
    AlarmSettingViewController()
}
