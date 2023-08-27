//
//  GrayBorderCircleImage.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/27.
//

import UIKit

class GrayBorderCircleImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.width/2
    }
    
    func setUpView() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 4
        backgroundColor = .brown
    }
}
