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
    
    private let rootView = AlarmSettingView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .appColor(.grey900)
        
    }
}


#Preview {
    AlarmSettingViewController()
}
