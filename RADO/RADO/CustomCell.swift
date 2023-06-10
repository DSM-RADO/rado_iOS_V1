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
    
    let myImageView = UIImageView().then {
        $0.layer.cornerRadius = 30
        $0.layer.masksToBounds = true
        $0.image = UIImage(systemName: "questionmark")
        $0.tintColor = .label
    }
    let myLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    let detailLabel = UILabel().then {
        $0.text = "하하하..."
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .gray
    }
    let timeLabel = UILabel().then {
        $0.text = "오후 11:49"
        $0.textAlignment = .right
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: UIImage, and label: String) {
        self.myImageView.image = image
        self.myLabel.text = label
    }
    
    private func setupUI() {
        [
            myImageView,
            myLabel,
            detailLabel,
            timeLabel
        ].forEach({self.contentView.addSubview($0)})
        myImageView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.layoutMarginsGuide.snp.top)
            $0.bottom.equalTo(self.contentView.layoutMarginsGuide.snp.bottom)
            $0.left.equalTo(self.contentView.layoutMarginsGuide.snp.left)
            $0.width.equalTo(66)
        }
        myLabel.snp.makeConstraints {
            $0.left.equalTo(self.myImageView.snp.right).offset(20)
            //$0.right.equalTo(self.contentView.snp.right).offset(-12)//무슨용도지?..
            $0.top.equalTo(self.contentView.snp.top).offset(-40)
            $0.bottom.equalTo(self.contentView.snp.bottom)
        }
        detailLabel.snp.makeConstraints {
            $0.left.equalTo(self.myImageView.snp.right).offset(20)
            $0.top.equalTo(self.myLabel.snp.bottom).inset(70)
            $0.bottom.equalTo(self.contentView.snp.bottom)
        }
        timeLabel.snp.makeConstraints {
            $0.right.equalTo(self.contentView).inset(30)
            $0.top.equalTo(self.contentView).inset(20)
        }
    }
}
