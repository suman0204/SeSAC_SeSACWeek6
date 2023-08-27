//
//  TopWhiteButton.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit

class TopWhiteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15)
    }
}
