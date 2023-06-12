import UIKit
import SnapKit
import Then

class SecondSignupViewController: UIViewController {
    
    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("가입하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
    }
    let idTextField = UITextField().then {
        $0.placeholder = "아이디"
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
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        moveViewButton.addTarget(self, action: #selector(moveNextView), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
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
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(71)
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
    }
    
    @objc func moveNextView() {
        self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
    }
}
    
