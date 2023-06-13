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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with image: UIImage, and label: String) {
        self.profileImage.image = image
        self.myLabel.text = label
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
            $0.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            $0.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            $0.left.equalTo(self.contentView.layoutMarginsGuide.snp.left)
            $0.width.equalTo(66)
        }
    }
}
