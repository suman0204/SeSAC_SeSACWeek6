//
//  CustomTableViewCell.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/25.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints() //addSubView이후에 constraints 설정해주어여함
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.addSubview(label)
        contentView.addSubview(button)
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
    }
    
    
    
    //xib파일을 만들었을 때,
    //Interface Builder에서 동작하는 코드
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
