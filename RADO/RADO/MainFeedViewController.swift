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
        $0.font = UIFont.systemFont(ofSize: 24)
    }
    let settingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "settingImage"), for: .normal)
        $0.tintColor = UIColor(named: "navy")
    }
    let tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.allowsSelection = true
        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    let feedPlusButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "plusImage"), for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        $0.tintColor = .white
        $0.backgroundColor = UIColor(named: "pink")
        $0.layer.cornerRadius = 30
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        addSubview()
        makeConstraints()
    }
    
    func addSubview() {
        [
            feedLabel,
            settingButton,
            tableView,
            feedPlusButton
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.left.equalToSuperview().inset(26)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(27)
            $0.width.height.equalTo(30)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(67)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        feedPlusButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(17)
            $0.width.height.equalTo(60)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
