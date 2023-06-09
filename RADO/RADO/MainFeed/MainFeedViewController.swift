import UIKit
import SnapKit
import Then
import Alamofire

class MainFeedViewController: UIViewController {
    
    var arr: [String] = []
    let feedLabel = UILabel().then {
        $0.text = "피드"
        $0.font = UIFont.systemFont(ofSize: 24)
    }
    let settingButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "settingImage"), for: .normal)
        $0.tintColor = .black
    }
    let tableView = UITableView().then {
        $0.backgroundColor = .white
        $0.allowsSelection = true
        $0.register(CustomCell.self, forCellReuseIdentifier: CustomCell.cellId)
    }
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
//        MainFeedViewController.tableView.estimatedRowHeight = 0
        tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = .none
        feedAddButton.addTarget(self, action: #selector(feedPlusButton), for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(moveUserSetting), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
            tableView,
            feedAddButton
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstraints() {

        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.left.equalToSuperview().inset(19)
        }
        settingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(27)
            $0.right.equalToSuperview().inset(27)
            $0.width.height.equalTo(30)
        }
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(85)
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }
        feedAddButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44)
            $0.right.equalToSuperview().inset(39)
            $0.width.height.equalTo(60)
        }
    }

    
    @objc func feedPlusButton() {
        self.navigationController?.pushViewController(FeedContentViewController(), animated: true)
        let backButton = UIBarButtonItem(title: "피드 작성", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
    @objc func moveUserSetting() {
        self.navigationController?.pushViewController(UserSettingViewController(), animated: true)
        let Backbutton = UIBarButtonItem(title: "회원 정보", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = Backbutton
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
    
}


extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellId, for: indexPath) as! CustomCell
        cell.textLabel?.text = arr[indexPath.row]
//        cell.actionView = {
//            self.moveView()
//        }()
        return cell
    }
    func moveView() {
        navigationController?.pushViewController(ReplyViewController(), animated: true)
    }
}

