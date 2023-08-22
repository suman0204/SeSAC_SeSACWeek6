//
//  Example2ViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/22.
//

import UIKit

class Example2ViewController: UIViewController {
    
    //MARK: 상단 버튼
    let closeButton = {
        let view = UIButton()
        
        view.tintColor = .white
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.backgroundColor = .blue

        return view
        
    }()
    
    let giftButton = {
        let view = UIButton()
        
        view.tintColor = .white
        view.setImage(UIImage(systemName: "gift.circle"), for: .normal)
        view.backgroundColor = .blue

        return view
    }()
    
    let payButton = {
        let view = UIButton()
        
        view.tintColor = .white
        view.setImage(UIImage(systemName: "qrcode"), for: .normal)
        view.backgroundColor = .blue
       
        return view
    }()

    let settingButton = {
        let view = UIButton()
        
        view.tintColor = .white
        view.setImage(UIImage(systemName: "gearshape.circle"), for: .normal)
        view.backgroundColor = .blue

        return view
    }()
    
    //MARK: 프로필 이미지, 이름, 상태메시지
    let profileImageView = {
        let view = UIImageView()
        
        view.backgroundColor = .blue
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    let nameLabel = {
        let view = UILabel()
        
        view.text = "Jack"
        view.textColor = .white
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .blue
        
        return view
    }()
    
    let stateMessageLabel = {
        let view = UILabel()
        
        view.text = "고래밥 맛있어요"
        view.textColor = .white
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 14)
        view.backgroundColor = .blue
        
        return view
    }()
    
    let dividerView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    //MARK: 하단 버튼
    let selfChatButton = {
        let view = UIButton()
        
        view.setTitle("나와의 채팅", for: .normal)
        view.setImage(UIImage(systemName: "bubble.left.fill"), for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13)
        view.tintColor = .white
        view.backgroundColor = .blue
        view.alignTextBelow(spacing: 10)
        
        return view
    }()
    
    let editProfileButton = {
        let view = UIButton()
        
        view.setTitle("프로필 편집", for: .normal)
        view.setImage(UIImage(systemName: "pencil"), for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13)
        view.tintColor = .white
        view.backgroundColor = .blue
        view.alignTextBelow(spacing: 10)
        
        return view
    }()
    
    let kakaoStoryButton = {
        let view = UIButton()
        
        view.setTitle("카카오스토리", for: .normal)
        view.setImage(UIImage(systemName: "leaf.fill"), for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 13)
        view.tintColor = .white
        view.backgroundColor = .blue
        view.alignTextBelow(spacing: 10)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        [closeButton, giftButton, payButton, settingButton, profileImageView, nameLabel, stateMessageLabel, dividerView, selfChatButton, editProfileButton, kakaoStoryButton].forEach {
            view.addSubview($0)
        }
        
        
        setupConstraints()
        

    }
    
    func setupConstraints() {
        //MARK: 상단 버튼 레이아웃
        closeButton.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(20)
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.size.equalTo(20)
        }
        
        payButton.snp.makeConstraints { make in
            make.trailing.equalTo(settingButton.snp.leading).offset(-20)
            make.centerY.equalTo(settingButton.snp.centerY)
            make.size.equalTo(20)
        }
        
        giftButton.snp.makeConstraints { make in
            make.trailing.equalTo(payButton.snp.leading).offset(-20)
            make.centerY.equalTo(payButton.snp.centerY)
            make.size.equalTo(20)
        }
        
        //MARK: 프로필 이미지, 이름, 상태메시지 레이아웃
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(UIScreen.main.bounds.height * 0.53)
            make.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.height.equalTo(25)
            make.width.equalTo(100)
        }
        
        stateMessageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(stateMessageLabel.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(1)
        }
        
        selfChatButton.snp.makeConstraints { make in
            make.centerY.equalTo(editProfileButton)
            make.trailing.equalTo(editProfileButton.snp.leading).offset(-30)
            make.size.equalTo(80)
        }
        
        editProfileButton.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(dividerView.snp.bottom).offset(15)
            make.size.equalTo(80)
        }

        kakaoStoryButton.snp.makeConstraints { make in
            make.centerY.equalTo(editProfileButton)
            make.leading.equalTo(editProfileButton.snp.trailing).offset(30)
            make.size.equalTo(80)
        }
        
    }


}

// UIButton image, title Vertical Alignment
extension UIButton {
    
    func alignTextBelow(spacing: CGFloat = 4.0) {
            guard let image = self.imageView?.image else {
                return
            }

            guard let titleLabel = self.titleLabel else {
                return
            }

            guard let titleText = titleLabel.text else {
                return
            }

            let titleSize = titleText.size(withAttributes: [
                NSAttributedString.Key.font: titleLabel.font as Any
            ])

            titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
        }
    
}
