import UIKit
import SnapKit
import Then
import Alamofire

class UserSettingViewController: UIViewController {

    let httpClient = HTTPClient()
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
        //이미지는 회원가입 뷰에서 보낸 이미지 끌어오는 방식으로 하기
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
            $0.height.equalTo(151)
        }
        userIdBackground.snp.makeConstraints {
//            $0.top.equalTo(profileImage.snp.bottom).offset(30)
            $0.top.equalToSuperview().inset(360)
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
            $0.bottom.equalToSuperview().inset(93)
            $0.left.right.equalToSuperview().inset(43)
            $0.height.equalTo(40)
        }
    }

    @objc func deleteAlert() {
//        let id = "dd"
//        let name = "ddd"
//        userIdLabel =
//        userInformation(id: idd, name: namee)
        let alert = UIAlertController(title: "진짜로 탈퇴하시겠습니까?", message: "내용을 입력해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "NO", style: .cancel))
        alert.addAction(UIAlertAction(title: "YES", style: .destructive){ action in
//            userDelete(id: id, password: <#T##String#>)
        })

        self.present(alert, animated: true, completion: nil)
    }
    //수정 필요
    //삭제에 성공하면 alert하나 더 만들어서 성공했다고 알림 띄워주기
    //실패해도 실패했다고 띄우기
    
}
extension UserSettingViewController {
    func userInformation(id: String, name: String) {
        httpClient.get(
            url: "/user",
            parmas: [
                "userId": id,
                "userName": name,
//                "userYear": year,
//                "userMonth": month,
//                "userDay": day
            ],
            header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                let decoder = JSONDecoder()
                do {
                    self.userIdLabel.text = id
                    self.userNameLabel.text = name
//                    userBirthDayLabel.text = "\(year,monthday)"
                    print("성공")
                } catch {
                    print(res.response?.statusCode)
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
    }
//    func userDelete(id: String, password: String) {
//        print("통신함")
//        httpClient.delete(
//            url: "/user",
//            parmas: [
//                "userId": id,
//                "userPassword": password
//            ],
//            header: Header.tokenIsEmpty.header()
//        ).response(completionHandler: { res in
//            switch res.response?.statusCode {
//            case 200:
//                let decorder = JSONDecoder()
//                do {
//                    let data = try decorder.decode(LoginModel.self, from: res.data!)
//                    let alert = UIAlertController(title: "회원 탈퇴", message: "뭐라고 쓰지..", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "확인", style: .default))
//                    self.present(alert, animated: true, completion: nil)
//                    print("회원탈퇴")
////                    self.accessTokenLabel.text = data.access_token
//                    print(data.accessToken)
//                    print(data.expiredAt)
//                } catch {
//                    print(res.response?.statusCode)
//                    print("로그인 실패")
//                    let alert = UIAlertController(title: "로그인 실패", message: "아이디와 비밀번호를 입력해주세요", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "확인", style: .default))
//                    self.present(alert, animated: true, completion: nil)
//                }
//            default:
//                print("오류!! \(res.response?.statusCode)")
//            }
//        })
//    }
}

