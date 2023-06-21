import UIKit
import SnapKit
import Then
import Alamofire

class SecondSignupViewController: UIViewController {
    
    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 8
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
    let passwordCheckTextField = UITextField().then {
        $0.placeholder = "비밀번호 확인"
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        moveViewButton.addTarget(self, action: #selector(moveNextView), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstraints()
    }
    
    func addSubView() {
        [
            moveViewButton,
            idTextField,
            idCheckButton,
            passwordTextField,
            passwordCheckTextField,
            privacyLabel,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(70)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.left.equalToSuperview().inset(31)
            $0.right.equalToSuperview().inset(123)
            $0.height.equalTo(40)
        }
        idCheckButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.left.equalTo(idTextField.snp.right).offset(5)
            $0.right.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(31)
            $0.height.equalTo(40)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(31)      
            $0.height.equalTo(40)
        }
        privacyLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(306)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    @objc func moveNextView() {
        self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
    }
}
    
