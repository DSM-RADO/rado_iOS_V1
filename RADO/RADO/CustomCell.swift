//
//  CustomCell.swift
//  KakaoTalkViewCloneCoding
//
//  Created by 조영준 on 2023/05/27.
//

import UIKit
import SnapKit
import Then

class CustomCell: UITableViewCell {
    
    static let identifier = "CustomCell"
    
    let profileImage = UIImageView().then {
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.image = UIImage(systemName: "testImage")
        $0.tintColor = .label
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
        $0.text = "dksjlkfdsldkljlfkah4u"
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
    
    func configure(with image: UIImage, and label: String) {
        self.profileImage.image = image
        self.userNameLabel.text = label
    }
    
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
            $0.top.equalToSuperview().inset(24)
            $0.left.equalToSuperview().inset(14)
            $0.width.height.equalTo(50)
        }
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(40)
            $0.left.equalTo(profileImage.snp.right).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        minutesAgoLabel.snp.makeConstraints {
            $0.left.equalTo(profileImage.snp.right).offset(80)
            $0.top.equalTo(userNameLabel.snp.bottom).inset(70)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
//        settingButton.snp.makeConstraints {
//
//        }
        feedContentLabel.snp.makeConstraints {
            $0.right.equalTo(self.contentView).inset(30)
            $0.top.equalTo(self.contentView).inset(20)
        }
    }
}
