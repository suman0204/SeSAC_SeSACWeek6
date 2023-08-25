//
//  CustomTableViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {
    
    //vidwDidLoad보다 클로저 구문이 먼저 실행이 됨
    //CustomTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1. 셀 높이 자동으로 조절
        
        view.delegate = self //self는 자기 자신의 인스턴스를 의미한다
        view.dataSource = self
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell") //xib 파일 없이 기본 셀 사용
        
        return view
    }()
    
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
//    var isExpand: Bool = false // false: text두 줄 보여주기 true: 모두 보여주기
    var list = [Sample(text: "테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트", isExpand: false), Sample(text: "adfadfadfhadfadf", isExpand: false), Sample(text: "테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트 테스트 셀 텍스트", isExpand: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("constraints")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }

    }


}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2 //2.
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
