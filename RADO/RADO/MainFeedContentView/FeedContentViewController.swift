import UIKit
import SnapKit
import Then

class FeedContentViewController: UIViewController {
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        //        $0.layer.cornerRadius = 75
        $0.layer.cornerRadius = $0.frame.height/2
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    let userName = UILabel().then {
        $0.text = "유지우"
        $0.font = UIFont.systemFont(ofSize: 23)
    }
    let feedContentField = UITextField().then {
        $0.placeholder = "입력하세요"
        $0.autocapitalizationType = .none
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 9.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -9.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
    }
    let feedContentLabel = UILabel().then {
        $0.text = ""
    }
    let textFieldBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "navy")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar()
        self.feedContentField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstrains()
    }
    
    func navigationBar() {
        let closeButton = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(closeTab))
        navigationItem.rightBarButtonItem = closeButton
        closeButton.tintColor = .black
    }
    
    func addSubView() {
        [
            profileImage,
            userName,
            textFieldBackground,
            feedContentLabel,
        ].forEach({self.view.addSubview($0)})
        textFieldBackground.addSubview(feedContentField)
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
        textFieldBackground.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(77)
        }
        feedContentField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(18)
            $0.left.right.equalToSuperview().inset(11)
        }
        feedContentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(23)
            $0.left.equalToSuperview().inset(14)
        }
    }
    @objc func closeTab() {
        let newViewController = FeedContentViewController()
        navigationController?.popViewController(animated: true)
//        let images2 = UIImage(named: "testImage")!
//        arr.append(images2)
//        tableView.reloadData()
        //위 코드들을 피드부분으로 옮겨서 완료버튼을 눌렀을 때 셀이 생기게하기
    }
    @objc func textFieldDidChange(_ sender: Any?) {
            self.feedContentLabel.text = self.feedContentField.text
        }
    
}
