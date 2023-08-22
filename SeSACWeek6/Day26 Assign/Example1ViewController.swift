//
//  Example1ViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/22.
//

import UIKit
import SnapKit

class Example1ViewController: UIViewController {
    
    let topView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        
        view.borderStyle = .none
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        
        return view
    }()
    
    let dateTextField = {
        let view = UITextField()
        
        view.borderStyle = .none
        view.layer.borderWidth = 1
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        
        return view
    }()
    
    let textView = {
        let view = UITextView()
        
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        [topView, titleTextField, dateTextField, textView].forEach {
            view.addSubview($0)
        }
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
//            make.centerX.equalTo(view)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.3)

        }
        
        titleTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(topView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
            
        }
        
        dateTextField.snp.makeConstraints { make in
            make.topMargin.equalTo(titleTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)

        }
        
        textView.snp.makeConstraints { make in
            make.topMargin.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(view).multipliedBy(0.45)
        }
    }

}
