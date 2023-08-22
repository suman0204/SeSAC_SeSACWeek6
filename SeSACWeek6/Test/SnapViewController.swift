//
//  SnapViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView
 superView
 offset inset
 */

class SnapViewController: UIViewController {
    
    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        //뷰에 redView 추가
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }

        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.center.equalTo(view)
            //            make.centerX.centerY.equalTo(view)
            //            make.centerX.equalTo(view)
            //            make.centerY.equalTo(view)
            make.size.equalTo(200)
            //            make.width.height.equalTo(200)
            //            make.width.equalTo(200)
            //            make.height.equalTo(200)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
            
            make.edges.equalTo(blueView).inset(50)
//            make.edges.equalToSuperview()
//            make.leading.top.bottom.trailing.equalToSuperview()
        }
        
    }


}
