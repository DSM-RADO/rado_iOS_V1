import UIKit
import SnapKit
import Then

class UserSettingViewController: UIViewController {

    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
        //원형으로 만들기
    }
    let imagePlusButton = UIButton(type: .system).then {
        $0.setTitle("변경하기", for: .normal)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
    let userIdTextField = UITextField().then {
        $0.placeholder = "userId"
        //서버에서 유저가 설정한 아이디 불러와서 텍스트 필드에 플레이스홀더로 보여주는 코드 짜기
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -12.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let userNameTextField = UITextField().then {
        $0.placeholder = "userName"
        //서버에서 유저가 설정한 이름 불러와서 텍스트 필드에 플레이스홀더로 보여주는 코드 짜기
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -12.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let userBirthDayTextField = UITextField().then {
        $0.placeholder = "2007-00-00"
        //서버에서 유저가 설정한 이름 불러와서 텍스트 필드에 플레이스홀더로 보여주는 코드 짜기
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 12.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -12.0, height: 0.0))
        $0.rightViewMode = .always
        $0.layer.cornerRadius = 10
    }
    let deleteAccountButton = UIButton(type: .system).then {
        $0.setTitle("회원탈퇴", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.setTitleColor(UIColor(named: "navy"), for: .normal)
        $0.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        deleteAccountButton.addTarget(self, action: #selector(deleteAlert), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstraints()
    }

    func addSubView() {
        [
            profileImage,
            imagePlusButton,
            userIdTextField,
            userNameTextField,
            userBirthDayTextField,
            deleteAccountButton,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(147)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(151.52)
        }
        imagePlusButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        userIdTextField.snp.makeConstraints {
            $0.top.equalTo(imagePlusButton.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        userNameTextField.snp.makeConstraints {
            $0.top.equalTo(userIdTextField.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        userBirthDayTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        deleteAccountButton.snp.makeConstraints {
            $0.top.equalTo(userIdTextField.snp.bottom).offset(227)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
    }

//    @objc func deleteAlert() {
//        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//                
//            let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
//            let okAction = UIAlertAction(title: "YES", style: .default, handler: nil)
//                
//            alert.addAction(cancelAction)
//            alert.addAction(okAction)
//                
//            let v = UIViewController()
//            v.view.backgroundColor = UIColor.white
//            alert.setValue(v, forKey: "contentViewController")
//                
//            self.present(alert, animated: false)
//    }
    
}
