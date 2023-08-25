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
        return view
    }()

    let tvProgramButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let movieButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let likedButton: UIButton = {
       let view = UIButton()
        return view
    }()
    
    let checkLikedButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let playButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    let infoButton: UIButton = {
       let view = UIButton()
        return view
    }()
    
    let previewLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let previewFirstImage: UIView = {
        let view = UIView()
        return view
    }()
    
    let previewSecondImage: UIView = {
        let view = UIView()
        return view
    }()
    
    let previewThirdImage: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backgroundView, logoLabel, tvProgramButton, movieButton, likedButton, checkLikedButton, playButton, infoButton, previewLabel, previewFirstImage, previewSecondImage, previewThirdImage].forEach {
            view.addSubview($0)
        }
       
    }
    

}

extension NetflixMainViewController {
    func setConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalTo(view)
            make.height.equalTo(view).multipliedBy(0.75)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            
        }
    }
}
