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

    let httpClient = HTTPClient()
    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    let nameTextField = UITextField().then {
        $0.placeholder = "이름"
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let idCheckButton = UIButton(type: .system).then {
        $0.setTitle("중복확인", for: .normal)
        $0.backgroundColor = UIColor(named: "pink")
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }

    let privacyLabel = UILabel().then {
        $0.text = "가입시 개인정보 수집 및 이용약관에\n\t동의하는 것으로 간주합니다."
        $0.numberOfLines = 2
        $0.textColor = UIColor(named: "gray")
    }
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.layer.cornerRadius = 75.76
        $0.clipsToBounds = true
        //원형으로 만들기
    }
    let imagePlusButton = UIButton(type: .system).then {
        $0.setTitle("추가하기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        moveViewButton.addTarget(self, action: #selector(moveSecondSignupView), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstraints()
    }

    func addSubView() {
        [
            moveViewButton,
            nameTextField,
            profileImage,
            imagePlusButton,
            idTextField,
            idCheckButton,
            passwordTextField,
            privacyLabel,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(70)
        }
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(171)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(151.52)
        }
        imagePlusButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(imagePlusButton.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(31)
            $0.right.equalToSuperview().inset(123)
            $0.height.equalTo(40)
        }
        idCheckButton.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(8)
            $0.left.equalTo(idTextField.snp.right).offset(5)
            $0.right.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        privacyLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(306)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    @objc func moveSecondSignupView() {
        self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
        let loginBackbutton = UIBarButtonItem(title: "회원가입", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = loginBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
        guard let name = nameTextField.text else {
            return
        }
        login(Name: name)
    }
    
}

extension FirstSignupViewController {
    func login(Name: String) {
        print("통신함")
        httpClient.post(
            url: "/user",
            parmas: [
                "userName": Name,
            ],
            header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                let decorder = JSONDecoder()
                do {
                    let data = try decorder.decode(LoginModel.self, from: res.data!)
                    print("성공")
                } catch {
                    print(res.response?.statusCode)
                    print("실패")
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
    }
}


