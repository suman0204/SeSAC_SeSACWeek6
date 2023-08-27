//
//  BottomVerticalButton.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/27.
//

import UIKit

class MiddleVerticalButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        tintColor = .white
        titleLabel?.font = .systemFont(ofSize: 13)
    }
}
