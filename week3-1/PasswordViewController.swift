/*

 */

import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let passwordButton = UIButton()
    let vaildateor = PasswordValidator()
    
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
        passwordTextField.autocapitalizationType = .none
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

        do {
            let input = passwordTextField.text ?? ""
            let inputVaild = try vaildateor.validate(with: input)
            if inputVaild {
                passwordLabel.text = "성공"
            }
        } catch {
                guard let modalError = error as? PasswordError else { return }
                errorAlert(modalError)
            }
        }
    
    func errorAlert(_ modalError: PasswordError) {
        let alert = UIAlertController(title: modalError.errorTitle, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
        
}
    




