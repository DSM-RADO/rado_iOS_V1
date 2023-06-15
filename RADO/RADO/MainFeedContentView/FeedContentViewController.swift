import UIKit
import SnapKit
import Then

class FeedContentViewController: UIViewController {
    
    let feedContentField = UITextField().then {
        $0.placeholder = "입력하세요"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 17.0, height: 0.0))
        $0.leftViewMode = .always
        $0.rightView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: -17.0, height: 0.0))
        $0.rightViewMode = .always
        $0.backgroundColor = UIColor.red
        $0.layer.cornerRadius = 10
        
    }
//    let textFieldBackground = UILabel().then {
//        $0.backgroundColor = UIColor(named: "navy")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        makeConstrains()
    }
    
    func addSubView() {
        [
            feedContentField,
//            textFieldBackground,
        ].forEach({self.view.addSubview($0)})
    }
    
    func makeConstrains() {
//        completeButton.snp.makeConstraints {
//
//        }
//        textFieldBackground.snp.makeConstraints {
//            $0.centerX.equalToSuperview()
//                        $0.top.equalToSuperview().offset(50)
//            //            $0.width.height.equalTo(100)
//            $0.top.equalToSuperview().inset(764)
//            $0.width.equalToSuperview()
//            $0.bottom.equalToSuperview()
//        }
        feedContentField.snp.makeConstraints {
//            $0.top.equalTo(textFieldBackground.snp.bottom).offset(12)
            $0.top.equalToSuperview().inset(500)
            $0.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(11)
            
//            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            
            }
        }
    }
