import UIKit
import SnapKit
import Then
import Alamofire

class FeedContentViewController: UIViewController {
    
    let httpClient = HTTPClient()
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.layer.cornerRadius = 33
        //        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let userName = UILabel().then {
        $0.text = "유지우"
        $0.font = UIFont.systemFont(ofSize: 23)
    }
    let feedContentField = UITextField().then {
        $0.placeholder = "입력하세요"
        $0.autocapitalizationType = .none
        $0.autocorrectionType = .no
        $0.spellCheckingType = .no
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 9.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -9.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor(named: "blue")?.cgColor
        $0.layer.borderWidth = 1
    }
    //키보드 올라오는거에 맞춰 필드도 올라가게 하기
    let feedContentLabel = UILabel().then {
        $0.text = ""
        $0.numberOfLines = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar()
        feedContentField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstrains()
    }
    
    func navigationBar() {
        let closeButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(closeTab))
        navigationItem.rightBarButtonItem = closeButton
        closeButton.tintColor = .lightGray
    }
    
    func addSubView() {
        [
            profileImage,
            userName,
            feedContentField,
            feedContentLabel,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstrains() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(98)
            $0.left.equalToSuperview().inset(12)
            $0.width.equalTo(66)
            $0.height.equalTo(66)
        }
        userName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(120)
            $0.left.equalTo(profileImage.snp.right).offset(30)
        }
        feedContentField.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(18)
            $0.left.right.equalToSuperview().inset(13)
            $0.height.equalTo(40)
        }
        feedContentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(23)
            $0.left.right.equalToSuperview().inset(14)
        }
    }
    @objc func closeTab() {
        if (feedContentField.text == "") {
            //타이틀 피드작성실패말고 다른 멘트로 바꾸기
            let alert = UIAlertController(title: "피드 작성 실패", message: "내용을 입력해주세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    @objc func textFieldDidChange(_ sender: Any?) {
        self.feedContentLabel.text = self.feedContentField.text
    }//피드 내용을 입력할 때 화면에 동시에 보이게 하는 코드
}

extension FeedContentViewController {
    func feedPost(content: String) {
        httpClient.post(url: "/board",
                        parmas: [
                            "content" : content
                        ],
                        header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode{
            case 200:
                let decorder = JSONDecoder()
                do {
                    _ = try decorder.decode(LoginModel.self, from: res.data!)
                    print("성공")
                } catch {
                    print(res.response?.statusCode)
                    print("실패")
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
        
    }//피드 내용을 서버로 보내는 코드
}
