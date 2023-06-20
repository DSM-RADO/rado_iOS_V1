import UIKit
import SnapKit
import Then

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
    }
    let feedContentLabel = UILabel().then {
        $0.text = ""
        $0.font = UIFont.systemFont(ofSize: 14)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubView()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(with image: UIImage, and label: String) {
//        self.profileImage.image = profileImage
//        self.userNameLabel.text = label
//    }
//
    func addSubView() {
        [
            profileImage,
            userNameLabel,
            minutesAgoLabel,
            settingButton,
            feedContentLabel,
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
//        settingButton.snp.makeConstraints {
//
//        }
        feedContentLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(18)
            $0.right.equalToSuperview().inset(22)
        }
    }
}
