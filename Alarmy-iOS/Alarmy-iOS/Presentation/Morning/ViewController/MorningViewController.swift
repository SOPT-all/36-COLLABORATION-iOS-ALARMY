//
//  MorningViewController.swift
//  Alarmy-iOS
//
//  Created by 이은지 on 5/12/25.
//

import UIKit

final class MorningViewController: UIViewController {

    private let rootView = MorningView()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
