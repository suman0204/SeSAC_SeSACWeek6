//
//  NetflixMainViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/24.
//

import UIKit
import SnapKit

class NetflixMainViewController: UIViewController {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let logoLabel: UILabel = {
        let view = UILabel()
        view.text = "N"
        view.textAlignment = .center
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 40)
        return view
    }()

    let tvProgramButton: UIButton = {
        let view = TopWhiteButton()
        view.setTitle("TV 프로그램", for: .normal)
        return view
    }()
    
    let movieButton: UIButton = {
        let view = TopWhiteButton()
        view.setTitle("영화", for: .normal)
        return view
    }()
    
    let likedButton: UIButton = {
        let view = TopWhiteButton()
        view.setTitle("내가 찜한 콘텐츠", for: .normal)
        return view
    }()
    
    let checkLikedButton: UIButton = {
        let view = MiddleVerticalButton()
        view.setTitle("내가 찜한 컨텐츠", for: .normal)
        view.setImage(UIImage(systemName: "checkmark"), for: .normal)
        view.alignTextBelow(spacing: 5)
        return view
    }()
    
    let playButton: UIButton = {
        let view = UIButton()
        view.tintColor = .black
        view.backgroundColor = .white
        view.setTitle(" 재생", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 14)
        view.setImage(UIImage(systemName: "play.fill"), for: .normal)
        view.layer.cornerRadius = 8
        
        return view
    }()
    
    let infoButton: UIButton = {
       let view = MiddleVerticalButton()
        view.setTitle("정보", for: .normal)
        view.setImage(UIImage(systemName: "info.circle"), for: .normal)
        view.alignTextBelow(spacing: 10)
        return view
    }()
    
    let previewLabel: UILabel = {
        let view = UILabel()
        view.text = "미리보기"
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    let previewFirstImage: UIView = {
        let view = GrayBorderCircleImage(frame: .zero)
        return view
    }()
    
    let previewSecondImage: UIView = {
        let view = GrayBorderCircleImage(frame: .zero)
        return view
    }()
    
    let previewThirdImage: UIView = {
        let view = GrayBorderCircleImage(frame: .zero)
        return view
    }()
    
    let topStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 20
        return view
    }()
    
    
    let bottomPreviewImageStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .equalSpacing
        view.spacing = 5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        print("load")
        
        [tvProgramButton, movieButton, likedButton].forEach {
            topStackView.addArrangedSubview($0)
        }
        

        
        [previewFirstImage, previewSecondImage, previewThirdImage].forEach {
            bottomPreviewImageStackView.addArrangedSubview($0)
        }
        
        [backgroundView, logoLabel, previewLabel, topStackView, checkLikedButton, playButton, infoButton, bottomPreviewImageStackView].forEach {
            view.addSubview($0)
        }
       
        setConstraints()
        
    }
    

}

extension NetflixMainViewController {
    func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.75)
            print("back")
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leadingMargin.equalTo(backgroundView.snp.leading).offset(20)
//            make.size.equalTo(50)
            print("logo")
        }
        
        topStackView.snp.makeConstraints { make in
            make.leadingMargin.equalTo(logoLabel.snp.trailing).offset(30)
            make.topMargin.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailingMargin.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-30)
            make.centerX.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(90)
        }
        
        checkLikedButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-35)
            make.trailing.equalTo(playButton.snp.leading).offset(-40)
        }
        
        infoButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-35)
            make.leading.equalTo(playButton.snp.trailing).offset(55)
        }
        
        previewLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(20)
            make.height.equalTo(30)
        }
        
        previewFirstImage.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        previewSecondImage.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        previewThirdImage.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        
        bottomPreviewImageStackView.snp.makeConstraints { make in
            print("image")
            make.top.equalTo(previewLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view).inset(20)
            make.height.equalTo(100)
        }
    }
}
