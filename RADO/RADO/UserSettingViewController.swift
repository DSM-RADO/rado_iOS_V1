import UIKit
import SnapKit
import Then

class UserSettingViewController: UIViewController {

    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "navy")
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstraints()
    }

    func addSubView() {
        [
            moveViewButton,
            userIdTextField,
            userNameTextField,
            userBirthDayTextField,
            profileImage,
            imagePlusButton,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(70)
        }
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
    }

}
