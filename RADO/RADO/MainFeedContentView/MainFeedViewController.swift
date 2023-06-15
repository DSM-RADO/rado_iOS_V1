import UIKit
import SnapKit
import Then

class MainFeedViewController: UIViewController {
    
    let feedLabel = UILabel().then {
        $0.text = "피드"
        $0.font = UIFont.systemFont(ofSize: 24)
    }
    let settingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "settingImage"), for: .normal)
        $0.tintColor = UIColor(named: "navy")
    }
//    let tableView = UITableView().then {
//        $0.backgroundColor = .white
//        $0.allowsSelection = true
//        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
//    }
    let feedAddButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "plusImage"), for: .normal)
        $0.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        $0.tintColor = .white
        $0.backgroundColor = UIColor(named: "pink")
        $0.layer.cornerRadius = 30
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        tableView.separatorStyle = .none
//        tableView.rowHeight = UITableView.automaticDimension
        feedAddButton.addTarget(self, action: #selector(feedPlusButton), for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(moveUserSetting), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        addSubview()
        makeConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    //뷰에서 네비게이션 바를 숨김

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    //위에서 숨긴 네비게이션바를 다음 뷰에서 다시 보여줌
    
    func addSubview() {
        [
            feedLabel,
            settingButton,
//            tableView,
            feedAddButton
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(22)
            $0.left.equalToSuperview().inset(26)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.right.equalToSuperview().inset(27)
            $0.width.height.equalTo(30)
        }
//        tableView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(67)
//            $0.bottom.equalToSuperview()
//            $0.width.equalToSuperview()
//        }
        feedAddButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.right.equalToSuperview().inset(17)
            $0.width.height.equalTo(60)
        }
    }

    
    @objc func feedPlusButton() {
        self.navigationController?.pushViewController(FeedContentViewController(), animated: true)
        let Backbutton = UIBarButtonItem(title: "새 피드", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = Backbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
        /* let images2 = UIImage(named: "testImage")!
        images.append(images2)
        tableView.reloadData()*/
        //위 코드들을 피드부분으로 옮겨서 완료버튼을 눌렀을 때 셀이 생기게하기
    }
    
    @objc func moveUserSetting() {
        self.navigationController?.pushViewController(UserSettingViewController(), animated: true)
        let Backbutton = UIBarButtonItem(title: "새 피드", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = Backbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}

//extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.images.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
//            fatalError("The TableView coul no dequeue a CustomCell in ViewController")
//        }
//        let image = self.images[indexPath.row]
//        cell.configure(with: image, and: "")
//        return cell
//    }
//
//}
