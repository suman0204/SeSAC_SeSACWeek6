//
//  PosterImageView.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/25.
//

import UIKit

class PosterImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(){
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
//        layer.cornerRadius = frame.width / 2 // 클로저 구문에서 frame을 zero로 초기화하기 때문에 원으로 보이지 않음
    }
    
    //하위 뷰의 레이아웃을 잡을 수 있는 메서드
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubView", frame.width, frame)
        layer.cornerRadius = frame.width / 2
    }
}
