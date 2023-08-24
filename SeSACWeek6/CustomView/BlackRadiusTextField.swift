//
//  BlackRadiusTextField.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    //인스턴스 만들 때 실행하고 싶은 요소를 초기화 구문에 넣어준다
    //Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    override init(frame: CGRect) { //UIView에 들어있는 init (슈퍼클래스로부터 온 init은 override)
        super.init(frame: frame)
        setupView()
    }
    
    //NSCoding
    //XIB -> NIB 변환 과정에서 객체 생성 시 필요한 init 구문 (storyboard)
    //Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문! (스토리보드가 실행될 때 이 구문을 통해 초기화 진행됨)
    required init?(coder: NSCoder) { //NSCoding에 들어있는 init
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    }
    
}

//protocol ExampleProtocol {
//    init(name: String)
//}
//
//class Mobile: ExampleProtocol {
//    //required: 프로토콜에서 생성된 경우 사용하는 키워드
//    //Required Initializer
//    required init(name: String) { //프로토콜에서 생성한 이니셜라이져
//        
//    }
//    
//    
//}
