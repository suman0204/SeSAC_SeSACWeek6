//
//  Theater.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/23.
//

import Foundation

struct Theater {
    let type: TheaterType
    let location: String
    let latitude: Double
    let longitude: Double
}

struct TheaterList {
    var mapAnnotations: [Theater] = [
        Theater(type: .lotteCinema, location: TheaterType.lotteCinema.theaterName(region: "서울대입구"), latitude: 37.4824761978647, longitude: 126.9521680487202),
        Theater(type: .lotteCinema, location: TheaterType.lotteCinema.theaterName(region: "가산디지털"), latitude: 37.47947929602294, longitude: 126.88891083192269),
        Theater(type: .megaBox, location: TheaterType.megaBox.theaterName(region: "이수"), latitude: 37.48581351541419, longitude:  126.98092132899579),
        Theater(type: .megaBox, location: TheaterType.megaBox.theaterName(region: "강남"), latitude: 37.49948523972615, longitude: 127.02570417165666),
        Theater(type: .cgv, location: TheaterType.cgv.theaterName(region: "영등포"), latitude: 37.52666023337906, longitude: 126.9258351013706),
        Theater(type: .cgv, location: TheaterType.cgv.theaterName(region: "용산 아이파크몰"), latitude: 37.53149302830903, longitude: 126.9654030486416)
    ]
}
