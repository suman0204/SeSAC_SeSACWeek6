//
//  ViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/21.
//

import UIKit
import SnapKit

//StoryBoard 방식
//1. 객체 얹고, 레이아웃 잡고, 아웃렛 연결, 속성 조절

//CodeBase 방식
//1. 뷰객체 프로퍼티 선언 (클래스 인스턴스 생성)
//2. 명시적으로 루트뷰에 추가 ( + translatesAutoresizingMaskIntoConstraints)
//3. 크기와 위치 정의
//4. 속성 정의
// => Frame 한계
// => AutoResizingMask, AutoLayout => 지금까지는 스토리보드로 대응했다
// => NSLayoutConstraints를 사용해서 오토레이웃을 코드 베이스로 대응
    //1. isActive
    //2. addConstraints
// => NSLayoutAnchor

class ViewController: UIViewController {
    
    //뷰 객체 프로퍼티 선언
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signButton = UIButton()
    let theaterButton = {
        let view = UIButton()
        
        view.setTitle("영화관", for: .normal)
        view.tintColor = .white
        view.backgroundColor = .black
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 루트뷰에 추가
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.frame = CGRect(x: 50, y: 80, width: UIScreen.main.bounds.width - 100, height: 50)
        
        emailTextField.backgroundColor = .lightGray
        emailTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .numberPad
        emailTextField.placeholder = "닉네임을 입력해주세요"
        
//        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50).isActive = true
//            //레이아웃 활성화
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60).isActive = true
//
//        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50).isActive = true
        
        //addConstraints
        let leading = NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 50)
            //레이아웃 활성화
        
        let trailing = NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: -50)
        
        let height = NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 60)
        
        let top = NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: emailTextField, attribute: .bottom, multiplier: 1, constant: 50)
        
        view.addConstraints([leading, trailing, height, top])
        
        passwordTextField.backgroundColor = .brown
        
        setLayoutAnchor()
        setLayoutSnp()
    }


    @objc func signButtonClicked() {
        let vc = LocationViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
        
    }
    
    func setLayoutAnchor() {
        view.addSubview(signButton)
        signButton.translatesAutoresizingMaskIntoConstraints = false
        
        signButton.backgroundColor = .blue
        
        signButton.addTarget(self, action: #selector(signButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300),
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        
    }
    
    @objc func theaterButtonClicked() {
        let vc = TheaterViewController()
        let nav = UINavigationController(rootViewController: vc)
        
//        self.navigationController?.pushViewController(vc, animated: true)
        present(nav, animated:true)
    }
    
    func setLayoutSnp() {
        view.addSubview(theaterButton)
        
        theaterButton.addTarget(self, action: #selector(theaterButtonClicked), for: .touchUpInside)
        
        theaterButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(signButton.snp.top).offset(-20)
            make.height.equalTo(50)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
}

