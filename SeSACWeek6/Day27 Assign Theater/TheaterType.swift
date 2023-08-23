//
//  TheaterType.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/23.
//

import Foundation

enum TheaterType: String, CaseIterable {
    case megaBox = "메가박스"
    case lotteCinema = "롯데시네마"
    case cgv = "CGV"
    case all = "전체보기"
    
    func theaterName(region: String) -> String {
        switch self {
        case .megaBox:
            return "\(TheaterType.megaBox.rawValue) \(region)"
        case .lotteCinema:
            return "\(TheaterType.lotteCinema.rawValue) \(region)"
        case.cgv:
            return "\(TheaterType.cgv.rawValue) \(region)"
        case .all:
            return "전체보기"
        }
    }
}
