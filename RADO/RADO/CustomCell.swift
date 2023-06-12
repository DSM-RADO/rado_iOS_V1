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
    
    let profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.image = UIImage(systemName: "mainLogo")
        $0.tintColor = .label
    }
//    let userName = UILabel().then {
//
//    }
//    let minutesAgoLabel = UILabel().then {
//
//    }
//    let mainContents = UILabel().then {
//
//    }
//    let likeButton = UIButton(type: .system).then {
//
//    }
//    let hateButton = UIButton(type: .system).then {
//
//    }
//    let commentButton = UIButton(type: .system).then {
//
//    }
//    let
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, and label: String) {
        self.profileImageView.image = image
//        self.myLabel.text = label
    }
    
    private func setupUI() {
        [
            
        ].forEach({self.contentView.addSubview($0)})
    }
}
