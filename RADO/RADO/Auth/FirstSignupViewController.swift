import UIKit
import SnapKit
import Then
import Alamofire

class FirstSignupViewController: UIViewController {
    
    let httpClient = HTTPClient()
    let moveViewButton = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(named: "blue")
        $0.setTitle("다음", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 8
    }
    let nameTextField = DefaultTextField(placeholder: "이름")
    let idTextField = DefaultTextField(placeholder: "아이디")
    let idCheckButton = UIButton(type: .system).then {
        $0.setTitle("중복확인", for: .normal)
        $0.backgroundColor = UIColor(named: "pink")
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    let passwordTextField = DefaultTextField(placeholder: "비밀번호")
    let yearBackground = UIView().then {
        $0.backgroundColor = UIColor(named: "lightGray")
        $0.layer.cornerRadius = 10
    }
    let yearLabel = UILabel().then {
        $0.text = "2007"
        $0.textColor = UIColor(named: "gray")
        $0.font = UIFont.systemFont(ofSize: 16)
    }
    let monthTextField = DefaultTextField(placeholder: "월")
    let dayTextField = DefaultTextField(placeholder: "일")
    
    let privacyLabel = UILabel().then {
        $0.text = "가입시 개인정보 수집 및 이용약관에\n\t동의하는 것으로 간주합니다."
        $0.font = UIFont.systemFont(ofSize: 12)
        $0.numberOfLines = 2
        $0.textColor = UIColor(named: "gray")
    }
    let profileImage = UIImageView().then {
        $0.image = UIImage(named: "testImage")
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 75
        $0.clipsToBounds = true
        //원형으로 만들기
    }
    let imagePlusButton = UIButton(type: .system).then {
        $0.setTitle("추가하기", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.setTitleColor(UIColor(named: "gray"), for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addTarget()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addSubView()
        makeConstraints()
    }
    
    func addSubView() {
        [
            moveViewButton,
            nameTextField,
            profileImage,
            imagePlusButton,
            idTextField,
            idCheckButton,
            passwordTextField,
            privacyLabel,
            yearBackground,
            yearLabel,
            monthTextField,
            dayTextField,
        ].forEach({self.view.addSubview($0)})
        yearBackground.addSubview(yearLabel)
    }
    
    func makeConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(125)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(151.52)
        }
        imagePlusButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(imagePlusButton.snp.bottom).offset(29.48)
            $0.left.right.equalToSuperview().inset(29)
        }
        yearBackground.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(4)
            $0.left.equalToSuperview().inset(29)
            $0.right.equalToSuperview().inset(233)
            $0.height.equalTo(44)
        }
        yearLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        monthTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(4)
            $0.left.equalTo(yearBackground.snp.right).offset(2)
            $0.right.equalToSuperview().inset(131)
        }
        dayTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(4)
            $0.left.equalTo(monthTextField.snp.right).offset(2)
            $0.right.equalToSuperview().inset(29)
            $0.height.equalTo(44)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(dayTextField.snp.bottom).offset(4)
            $0.left.equalToSuperview().inset(29)
            $0.right.equalToSuperview().inset(123)
        }
        idCheckButton.snp.makeConstraints {
            $0.top.equalTo(dayTextField.snp.bottom).offset(4)
            $0.left.equalTo(idTextField.snp.right).offset(4)
            $0.right.equalToSuperview().inset(29)
            $0.height.equalTo(44)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(4)
            $0.left.right.equalToSuperview().inset(29)
        }
        privacyLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(158.32)
            $0.top.equalToSuperview().inset(653)
            $0.centerX.equalToSuperview()
        }
        moveViewButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(26)
            $0.left.right.equalToSuperview().inset(17)
            $0.height.equalTo(48)
        }
    }
    func addTarget() {
        moveViewButton.addTarget(self, action: #selector(moveMainFeedView), for: .touchUpInside)
        idCheckButton.addTarget(self, action: #selector(idCheckAlert), for: .touchUpInside)
        imagePlusButton.addTarget(self, action: #selector(photoAdd), for: .touchUpInside)
    }
    func alert(empty: String) {
        self.navigationItem.backBarButtonItem?.tintColor = .black
        let alert = UIAlertController(title: "회원가입 실패", message: "\(empty) 입력해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true, completion: nil)
    }// 이 alert 함수가 밑에 moveFeedView에서 작동함
    func idCheck() {
        
    }
}

extension FirstSignupViewController {
    
    @objc func idCheckAlert() {
        let idAlert = CustomAlert(title: "사용 가능한 아이디입니다.")
        present(idAlert, animated: true)
    }
    @objc func moveMainFeedView() {
        if(nameTextField.text == ""){
            alert(empty: "이름을")
        }else if(monthTextField.text == ""){
            alert(empty: "생년월일을")
        }else if(dayTextField.text == ""){
            alert(empty: "생년월일을")
        }else if(idTextField.text == "") {
            alert(empty: "아이디를")
        }else if(passwordTextField.text == ""){
            alert(empty: "비밀번호를")
        }else {
            guard
                let id = idTextField.text,
                let name = nameTextField.text,
                let password = passwordTextField.text,
                let year = Int(yearLabel.text!),
                let month = Int(monthTextField.text!),
                let day = Int(dayTextField.text!)
            else {
                return
            }
            signup(id: id, name: name, password: password, year: year, month: month, day: day)
            self.navigationController?.pushViewController(MainFeedViewController(), animated: true)
        }
    }
    func signup(id: String, name: String, password: String, year: Int, month: Int, day: Int) {
        print("통신함")
        httpClient.post(
            url: "/user",
            parmas: [
                "userId": id,
                "userName" : name,
                "userPassword" : password,
                "year" : year,
                "month" : month,
                "day" : day
            ],
            header: Header.tokenIsEmpty.header()
        ).response(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                let decorder = JSONDecoder()
                do {
                    _ = try decorder.decode(LoginModel.self, from: res.data!)
                    //선배님께 여쭤보기
                    print("성공")
                } catch {
                    print(res.response?.statusCode)
                    print("실패")
                }
            default:
                print("오류!! \(res.response?.statusCode)")
            }
        })
    }
    //회원가입 서버통신 코드
}

extension FirstSignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func photoAdd(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }//추가하기 버튼을 누르면 앨범에 있는 사진을 보여주는 코드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFill
            profileImage.image = pickedImage //4
        }
        dismiss(animated: true, completion: nil)
    }//앨범에 있는 사진을 프로필 이미지로 적용시키는 코드

        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
