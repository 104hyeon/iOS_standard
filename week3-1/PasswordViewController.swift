/*
 UI/레이아웃 요구사항
 뷰컨트롤러명 : PasswordViewController

 passwordLabel
 화면 정가운데 정렬

 passwordTextField
 높이 50
 좌우 30 인셋
 passwordLabel 위에 위치하며 간격 10
 borderStyle은 roundedRect
 password라고 입력하고 passwordButton을 누르면 passwordLabel text를 "성공"으로 변경

 passwordButton
 passwordLabel 밑에 간격 10 위치, center Label과 맞춤
 Title: 입력
 Width : 100, height : 50
 backgroundColor : red
 */

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordButton = UIButton()
    
    let password: String = "password"

    override func viewDidLoad() {
        super.viewDidLoad()
        confitureUI()
        setConstraintsUI()
    }
    
    func confitureUI() {
        view.backgroundColor = .white
        passwordLabel.text = "Password"
        passwordLabel.textColor = .black
        passwordLabel.font = .boldSystemFont(ofSize: 40)
        passwordLabel.textAlignment = .center
        
        passwordTextField.borderStyle = .roundedRect

        passwordButton.setTitle("입력", for: .normal)
        passwordButton.backgroundColor = .red
        passwordButton.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
        
        [passwordLabel, passwordButton, passwordTextField]
            .forEach { view.addSubview($0) }
        
    }
    
    func setConstraintsUI() {
        passwordLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            
        }
        
        passwordTextField.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(passwordLabel.snp.top).offset(-10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
            
               
        passwordButton.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(50)
            $0.centerX.equalTo(passwordLabel.snp.centerX)
            $0.top.equalTo(passwordLabel.snp.bottom).offset(10)
        }
    }
    
    @objc
    func didTabButton() {
        let _: Bool = passwordTextField.text == self.password
        passwordLabel.text = "성공"
        
    }


}

