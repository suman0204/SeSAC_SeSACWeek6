//
//  GrayBackgroundTextField.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit

class GrayBackgroundTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = .systemGray3
        self.textColor = .black
        self.borderStyle = .none
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor.systemGray3.cgColor
        self.layer.borderWidth = 1
        self.textAlignment = .center
    }
}
