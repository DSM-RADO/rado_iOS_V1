import UIKit
import SnapKit
import Then
import Alamofire

class UserSettingViewController: UIViewController {

    let httpClient = HTTPClient()
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
    let userIdBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    let userNameBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    let userBirthDayBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    
    let userIdLabel = UILabel().then {
        $0.text = "userId"
        $0.textColor = UIColor(named: "gray")
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    let userNameLabel = UILabel().then {
        $0.text = "userName"
        $0.textColor = UIColor(named: "gray")
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    let userBirthDayLabel = UILabel().then {
        $0.text = "2007-00-00"
        $0.textColor = UIColor(named: "gray")
        $0.font = UIFont.systemFont(ofSize: 15)
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
        deleteAccountButton.addTarget(self, action: #selector(deleteAlert), for: .touchUpInside)
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
            userIdLabel,
            userNameLabel,
            userBirthDayLabel,
            userIdBackground,
            userNameBackground,
            userBirthDayBackground,
            deleteAccountButton,
        ].forEach({self.view.addSubview($0)})
        userIdBackground.addSubview(userIdLabel)
        userNameBackground.addSubview(userNameLabel)
        userBirthDayBackground.addSubview(userBirthDayLabel)
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
        userIdBackground.snp.makeConstraints {
            $0.top.equalTo(imagePlusButton.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        userIdLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.left.equalToSuperview().inset(12)
        }
        userNameBackground.snp.makeConstraints {
            $0.top.equalTo(userIdBackground.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.left.equalToSuperview().inset(12)
        }
        userBirthDayBackground.snp.makeConstraints {
            $0.top.equalTo(userNameBackground.snp.bottom).offset(6)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
        userBirthDayLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(9)
            $0.left.equalToSuperview().inset(12)
        }
        deleteAccountButton.snp.makeConstraints {
            $0.top.equalTo(userIdBackground.snp.bottom).offset(227)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(40)
        }
    }

    @objc func deleteAlert() {
        let alert = UIAlertController(title: "진짜로 탈퇴하시겠습니까?", message: "내용을 입력해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "NO", style: .cancel))
        alert.addAction(UIAlertAction(title: "YES", style: .destructive))
        //        func userDelete() {
//            httpClient.delete(url: /user/, parmas: nil, header: Header.tokenIsEmpty.header())
//        }
        self.present(alert, animated: true, completion: nil)
    }
    //수정 필요
    
}
