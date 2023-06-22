import UIKit
import SnapKit
import Then
import Alamofire

class CustomCell: UITableViewCell {
    
    static let cellId = "CellId"

    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
    }
    let userNameLabel = UILabel().then {
        $0.text = "유지우"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
    }
    let minutesAgoLabel = UILabel().then {
        $0.text = "20분 전"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    let settingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "feedSetting"), for: .normal)
        $0.tintColor = UIColor(named: "navy")
    }
    let feedContentLabel = UILabel().then {
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines  = 0
    }
    let replyButton = UIButton(type: .system).then {
        $0.setTitle("댓글달기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        makeConstraints()
//        replyButton.addTarget(self, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubView() {
        [
            profileImage,
            userNameLabel,
            minutesAgoLabel,
            settingButton,
            feedContentLabel,
            replyButton,
        ].forEach({self.contentView.addSubview($0)})
    }
    func makeConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.left.equalToSuperview().inset(10)
            $0.width.height.equalTo(50)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.left.equalTo(profileImage.snp.right).offset(11)
        }
        minutesAgoLabel.snp.makeConstraints {
            $0.left.equalTo(profileImage.snp.right).offset(14)
            $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.right.equalToSuperview().inset(26)
            $0.height.equalTo(20)
            $0.width.equalTo(4)
        }
        feedContentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(18)
            $0.right.equalToSuperview().inset(22)
        }
        replyButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.right.equalToSuperview().inset(22)
        }
    }
    
//    @objc func feedSetting() {
//        let alert = UIAlertController(title: "피드 작성 실패", message: "내용을 입력해주세요", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "확인", style: .default))
//        self.present(alert, animated: true, completion: nil)
//    }
//    @objc func moveReply() {
//        self.
//    }
}

