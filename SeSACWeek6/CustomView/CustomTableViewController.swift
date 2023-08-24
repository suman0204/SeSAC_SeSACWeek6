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
    
    let tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension //1. 셀 높이 자동으로 조절
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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell") //xib 파일 없이 기본 셀 사용
    }


}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2 //2.
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
