import UIKit
import SnapKit
import Then
import Alamofire

class FirstLoginViewController: UIViewController {

    let httpClient = HTTPClient()
    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("로그인 하기", for: .normal)
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
            passwordTextField,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(70)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(143)
            $0.left.right.equalToSuperview().inset(21)
            $0.height.equalTo(48)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(21)
            $0.height.equalTo(48)
        }
    }
 
    @objc func moveNextView() {
        if(idTextField.text == "" || passwordTextField.text == "") {
            print("실패")
            let alert = UIAlertController(title: "로그인 실패", message: "아이디와 비밀번호를 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true, completion: nil)
        }else {
            guard let id = idTextField.text,
                  let password = passwordTextField.text else {
                return
            }
            login(id: id , password: password)
        }
        self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
        let loginBackbutton = UIBarButtonItem(title: "로그인", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = loginBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
}

extension FirstLoginViewController {
    func login(id: String, password: String) {
        print("통신함")
        httpClient.post(
            url: "/user/login",
            parmas: [
                "userId": id,
                "userPassword": password
            ],
            header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                let decorder = JSONDecoder()
                do {
                    let data = try decorder.decode(LoginModel.self, from: res.data!)
                    print("로그인 성공")
//                    self.accessTokenLabel.text = data.access_token
                    print(data.accessToken)
                    print(data.expiredAt)
                } catch {
                    print(res.response?.statusCode)
                    print("로그인 실패")
                    let alert = UIAlertController(title: "로그인 실패", message: "아이디와 비밀번호를 입력해주세요", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
    }
}
