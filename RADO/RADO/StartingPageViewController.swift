import UIKit
import SnapKit
import Then

class StartingPageViewController: UIViewController {

    let mainLogoImage = UIImageView().then {
        $0.image = UIImage(named: "mainLogo")
    }
    let mainName = UILabel().then {
        $0.text = "RADO"
        $0.font = UIFont(name: "PTSans-NarrowBold", size: 48)
        $0.textColor = UIColor(named: "navy")
    }
    let loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
        $0.layer.cornerRadius = 10
    }
    let signupButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
        $0.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationbar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstrains()
        button()
    }

    func navigationbar() {
        self.navigationItem.leftBarButtonItem = nil
        let signupBackbutton = UIBarButtonItem(title: "회원가입", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = signupBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    func button() {
        loginButton.addTarget(self, action: #selector(moveLoginPage), for: .touchUpInside)
        signupButton.addTarget(self, action: #selector(moveSignupPage), for: .touchUpInside)
    }
    
}
// MARK: addSubView & makeConstrains

extension StartingPageViewController {
    func addSubView() {
        [
            mainLogoImage,
            mainName,
            loginButton,
            signupButton,
        ].forEach({self.view.addSubview($0)})
    }

    func makeConstrains() {
        //레이아웃 다시 잡고 se로 실행 시키기
        mainLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(166)
            $0.bottom.equalToSuperview().inset(378)
            $0.left.right.equalToSuperview().inset(37.11)
        }
        mainName.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom)
            $0.bottom.equalToSuperview().inset(329)
            $0.centerX.equalToSuperview()
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(mainName.snp.bottom).offset(160)
            $0.left.right.equalToSuperview().inset(42.5)
            $0.height.equalTo(45)
        }
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(42.5)
            $0.height.equalTo(45)
        }
    }
}

// MARK: moveLoginPage & moveSignupPage

extension StartingPageViewController {
    @objc func moveLoginPage() {
        self.navigationController?.pushViewController(FirstLoginViewController(), animated: true)
        let loginBackbutton = UIBarButtonItem(title: "로그인", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = loginBackbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    @objc func moveSignupPage() {
        self.navigationController?.pushViewController(FirstSignupViewController(), animated: true)
        let Backbutton = UIBarButtonItem(title: "회원가입", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = Backbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
}
