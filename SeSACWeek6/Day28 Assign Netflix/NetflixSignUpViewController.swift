//
//  NetflixSignUpViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixSignUpViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "JACKFLIX"
        view.textColor = .red
        view.font = .boldSystemFont(ofSize: 30)
        view.textAlignment = .center
        return view
    }()
    
    let emailTextField: UITextField = {
        let view = GrayBackgroundTextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = GrayBackgroundTextField()
        view.placeholder = "비밀번호"
        return view
    }()
    
    let nicknameTextField: UITextField = {
        let view = GrayBackgroundTextField()
        view.placeholder = "닉네임"
        return view
    }()
    
    let locationTextField: UITextField = {
        let view = GrayBackgroundTextField()
        view.placeholder = "위치"
        return view
    }()
    
    let recommandCodeTextField: UITextField = {
        let view = GrayBackgroundTextField()
        view.placeholder = "추천 코드 입력"
        return view
    }()
    
    let signUpButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    let extraInfoLabel: UILabel = {
        let view = UILabel()
        view.text = "추가 정보 입력"
        view.textColor = .white
        
        return view
    }()
    
    let extraInfoSwitch: UISwitch = UISwitch()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, recommandCodeTextField, signUpButton, extraInfoLabel, extraInfoSwitch].forEach {
            view.addSubview($0)
        }
        
        view.backgroundColor = .black
        
        setConstraints()

        
        
    }
    


}

extension NetflixSignUpViewController {
    //set Constraints
    func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.topMargin.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(titleLabel.snp.bottom).offset(150)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(emailTextField.snp.bottom).offset(25)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(passwordTextField.snp.bottom).offset(25)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(nicknameTextField.snp.bottom).offset(25)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        recommandCodeTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(locationTextField.snp.bottom).offset(25)
            make.height.equalTo(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(recommandCodeTextField.snp.bottom).offset(25)
            make.height.equalTo(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        extraInfoLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(signUpButton.snp.bottom).offset(25)
            make.leadingMargin.equalToSuperview().offset(30)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        extraInfoSwitch.snp.makeConstraints { make in
            make.topMargin.equalTo(signUpButton.snp.bottom).offset(25)
            make.trailingMargin.equalToSuperview().offset(-30)
            make.height.equalTo(30)
            make.width.equalTo(40)
        }
        
    }
}
