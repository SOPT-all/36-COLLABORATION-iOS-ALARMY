//
//  AlarmSettingViewController.swift
//  Alarmy-iOS
//
//  Created by seozero on 5/14/25.
//

import UIKit

import SnapKit
import Then

class AlarmSettingViewController: UIViewController {
    // MARK: - Properties
    
    // MARK: - UI Properties
    private let xButton = UIButton()
    private let timeUntilAlarmLabel = UILabel()
    private let headerStackView = UIStackView()
    
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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setStyle()
        setHierarchy()
        setLayout()
        register()
        setDelegate()
        setCollectionviewLayout()
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
        
        // TODO: StackView로 하니까 Label이 완전 중앙정렬은 아니어서 이대로 할 지, StackView 안 쓸 지 결정해야 함
        headerStackView.do {
            [xButton, timeUntilAlarmLabel].forEach {
                headerStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 82
            $0.alignment = .center
            $0.distribution = .equalSpacing
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
            $0.distribution = .equalSpacing
        }
        
        selectDayStackView.do {
            [selectedDayLabel, everyDayCheckStackView].forEach {
                selectDayStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 139
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
            $0.spacing = 19.5
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
            $0.distribution = .equalSpacing
        }
        
        missionStackView.do {
            [missionLabelStackView, missionCollectionView].forEach {
                missionStackView.addArrangedSubview($0)
            }
            $0.axis = .horizontal
            $0.spacing = 20
            $0.distribution = .equalSpacing
            $0.alignment = .center
//            $0.backgroundColor = .red
        }
        
        missionCollectionView.do {
            $0.backgroundColor = .blue
        }
    }
    
    private func setLayout() {
        headerStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.height.equalTo(xButton.snp.height)
        }
        
        timePicker.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(160)
        }
        
        selectDayStackView.snp.makeConstraints {
            $0.top.equalTo(timePicker.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        selectDayButtonStackView.snp.makeConstraints {
            $0.top.equalTo(selectDayStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        divider1.snp.makeConstraints {
            $0.top.equalTo(selectDayButtonStackView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        missionStackView.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(68)
        }
        
        missionCollectionView.snp.makeConstraints {
            $0.height.equalTo(68)
        }
        
    }
    
    private func setHierarchy() {
        [headerStackView, timePicker, selectDayStackView, selectDayButtonStackView, divider1, missionStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func setCollectionviewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        missionCollectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    // MARK: - Function
    
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
    
    // MARK: - objc
    
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
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}


#Preview {
    AlarmSettingViewController()
}
