//
//  MainFeedViewController.swift
//  RADO
//
//  Created by 조영준 on 2023/06/08.
//

import UIKit
import SnapKit
import Then

class MainFeedViewController: UIViewController {

    var images: [UIImage] = [
        UIImage(named: "testImage")!
    ]
    
    let feedLabel = UILabel().then {
        $0.text = "피드"
        $0.font = UIFont.systemFont(ofSize: 24)
    }
    let systemSettingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "settingImage"), for: .normal)
        $0.tintColor = UIColor(named: "navy")
    }
    let tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.allowsSelection = true
//        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    let feedPlusButton = UIButton(type: .system).then {
        $0.setTitle("+", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = UIColor(named: "pink")
        $0.layer.cornerRadius = 70
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

    }
    
    override func viewDidLayoutSubviews() {
        addSubview()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func addSubview() {
        [
            feedLabel,
            systemSettingButton,
            tableView,
            feedPlusButton
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.left.equalToSuperview().inset(26)
        }
        systemSettingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22.5)
            $0.right.equalToSuperview().inset(29.5)
            $0.width.height.equalTo(25)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(67)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        feedPlusButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(768)
            $0.left.equalToSuperview().inset(311)
            $0.width.height.equalTo(60)
        }
    }
    
    @objc func feedButton() {
        let images2 = UIImage(named: "testImage")!
        images.append(images2)
        tableView.reloadData()
    }
    

}
extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("The TableView coul no dequeue a CustomCell in ViewController")
        }
        let image = self.images[indexPath.row]
        cell.configure(with: image, and: "조영준")
        return cell
    }
    
    //스와이프해서 삭제
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            tableView.beginUpdates()
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    //여기까지
}
