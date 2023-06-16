import UIKit
import SnapKit
import Then

class FeedContentViewController: UIViewController {
    
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
    }
    let feedContentField = UITextField().then {
        $0.placeholder = "입력하세요"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 9.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -9.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
    }
    
    let textFieldBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "navy")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstrains()
    }
    
    
    func addSubView() {
        [
//            profileImage,
            textFieldBackground,
        ].forEach({self.view.addSubview($0)})
        textFieldBackground.addSubview(feedContentField)
    }
    
    func makeConstrains() {
        //        profileImage.snp.makeConstraints {
//            $0.width.equalToSuperview().inset(66)
//            $0.height.equalToSuperview().inset(64)
//        }
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
    }
}
