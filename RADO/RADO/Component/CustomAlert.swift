//
//  CustomAlert.swift
//  RADO
//
//  Created by 조영준 on 2023/07/05.
//

import UIKit
import SnapKit
import Then

class CustomAlert: UIViewController {
    let alertView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
    }
    let lineView = UIView().then {
        $0.backgroundColor = UIColor(named: "lightGray")
    }
    let titleLabel = UILabel().then {
        $0.text = ""
        $0.textColor = UIColor(named: "gray")
        $0.font = UIFont.boldSystemFont(ofSize: 16)
    }
    let closeButton = UIButton(type: .system).then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setup()
    }
    
    func setup() {
        view.addSubview(alertView)
        [
            lineView,
            titleLabel,
            closeButton
        ].forEach({alertView.addSubview($0)})
    
        alertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(75)
            $0.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.centerX.equalToSuperview()
        }
        lineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(19)
            $0.height.equalTo(1)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        closeButton.addTarget(self, action: #selector(clickCloseButton), for: .touchUpInside)
    }
    
    @objc func clickCloseButton() {
        dismiss(animated: true)
    }
    func alertMessage(title: String) {
        titleLabel.text = title
        self.modalPresentationStyle = .overFullScreen
    }
}

