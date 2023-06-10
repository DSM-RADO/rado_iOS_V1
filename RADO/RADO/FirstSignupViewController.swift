//
//  SignupViewController.swift
//  RADO
//
//  Created by 조영준 on 2023/06/08.
//

import UIKit
import SnapKit
import Then

class FirstSignupViewController: UIViewController {

    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    let nameTextField = UITextField().then {
        $0.placeholder = "이름"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        //원형으로 만들기
    }
    let imagePlusButton = UIButton(type: .system).then {
        $0.setTitle("추가하기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
//    let birthDayTextField = UITextField().then {
//        $0.placeholder = "생년월일"
//        $0.font = UIFont.systemFont(ofSize: 15)
//        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
//        $0.leftViewMode = .always
//        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
//        $0.rightViewMode = .always
//        $0.backgroundColor = UIColor(named: "lightGray")
//        $0.layer.cornerRadius = 10
//    }
    let birthDayPicker = UIDatePicker().then {
        $0.preferredDatePickerStyle = .wheels
          $0.datePickerMode = .date
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        moveViewButton.addTarget(self, action: #selector(moveSecondSignupView), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }

    func addSubView() {
        [
            moveViewButton,
            nameTextField,
//            birthDayTextField,
            birthDayPicker,
            profileImage,
            imagePlusButton,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.width.equalTo(390)
            $0.height.equalTo(70)
        }
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(181)
            $0.left.right.equalToSuperview().inset(120)
            $0.width.equalTo(150)
            $0.height.equalTo(151.52)
        }
        imagePlusButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(166.5)
        }
        nameTextField.snp.makeConstraints {
//            $0.top.equalTo(imagePlusButton.snp.top).inset(30)
            $0.top.equalToSuperview().inset(378.52)       $0.left.right.equalToSuperview().inset(45)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
//        birthDayTextField.snp.makeConstraints {
//            $0.top.equalTo(self.nameTextField.snp.bottom).offset(10)
//            $0.left.equalToSuperview().inset(45)
//            $0.width.equalTo(300)
//            $0.height.equalTo(40)
//        }
        birthDayPicker.snp.makeConstraints {
            $0.top.equalTo(self.nameTextField.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(45)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
 
    @objc func moveSecondSignupView() {
        self.navigationController?.pushViewController(SecondSignupViewController(), animated: true)
        let loginBackbutton = UIBarButtonItem(title: "회원가입", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = loginBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}

