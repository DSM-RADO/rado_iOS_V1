//
//  MainFeedViewController.swift
//  RADO
//
//  Created by 조영준 on 2023/06/08.
//

import UIKit
import SnapKit
import Then

class MainFeedViewController: UIViewController {

    let feedLabel = UILabel().then {
        $0.text = "피드"
        $0.font = UIFont.systemFont(ofSize: 18)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

    }
    
    override func viewDidLayoutSubviews() {
        addSubview()
    }
    
    func addSubview() {
        [
            feedLabel,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(<#T##amount: ConstraintInsetTarget##ConstraintInsetTarget#>)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
