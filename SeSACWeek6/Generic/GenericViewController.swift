//
//  GenericViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {
    
    let sampleLable = UILabel()
    let sampleButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "네비게이션 타이틀"
        view.backgroundColor = .brown
        
        view.addSubview(sampleLable)
        sampleLable.backgroundColor = .yellow
        configureBorder(view: sampleLable)
        sampleLable.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLable.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let generic = sum(a: 3.344, b: 4.77)
        let generic2 = sum(a: 22, b: 88)
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        let value2 = sumDouble(a: 3.5, b: 7.7)
        print(value2)
    }
    

}
