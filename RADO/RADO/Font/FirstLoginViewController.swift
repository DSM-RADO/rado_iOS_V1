import UIKit
import SnapKit
import Then

class FirstLoginViewController: UIViewController {

    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("로그인 하기", for: .normal)
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
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -16.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        moveViewButton.addTarget(self, action: #selector(moveNextView), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }

    func addSubView() {
        [
            moveViewButton,
            idTextField,
            passwordTextField,
            passwordCheckTextField,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(774)
            $0.width.equalTo(390)
            $0.height.equalTo(70)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(143)
            $0.left.equalToSuperview().inset(31)
            $0.width.equalTo(328)
            $0.height.equalTo(37)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(self.idTextField.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(31)
            $0.width.equalTo(328)
            $0.height.equalTo(37)
        }
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(self.passwordTextField.snp.bottom).offset(8)
            $0.left.equalToSuperview().inset(31)
            $0.width.equalTo(328)
            $0.height.equalTo(37)
        }
    }
 
    @objc func moveNextView() {
        self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
        let loginBackbutton = UIBarButtonItem(title: "로그인", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = loginBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}
