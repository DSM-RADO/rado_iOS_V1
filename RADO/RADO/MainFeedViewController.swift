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
    let tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.allowsSelection = true
//        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    let feedPlusButton = UIButton(type: .system).then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(named: "pink")
        $0.layer.cornerRadius = 70
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
            tableView,
            feedPlusButton
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.left.equalToSuperview().inset(26)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(67)
            $0.width.equalTo(390)
            $0.height.equalToSuperview()
        }
        feedPlusButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(768)
            $0.left.equalToSuperview().inset(311)
            $0.width.height.equalTo(60)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
