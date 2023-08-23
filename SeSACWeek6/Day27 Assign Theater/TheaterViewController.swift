//
//  TheaterViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/23.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

class TheaterViewController: UIViewController {
    
    //위치 매니저
    let locationManager = CLLocationManager()
    
    let theaterTypeList = TheaterType.allCases
    let theaterList = TheaterList()
    
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self

        view.backgroundColor = .white
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        //왼쪽 BarButtonItem
        let myLocationButton = UIBarButtonItem(title: "내 위치", style: .plain, target: self, action: #selector(clickedMyLocation))
        navigationItem.leftBarButtonItem = myLocationButton
        
        //오른쪽 BarButtonItem
        let filterButton = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(selectTheaterSheet))
        navigationItem.rightBarButtonItem = filterButton
        
        //위치 권한 여부 확인
        checkDeviceLocationAuthorization()
        
        //디폴트 센터
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        
        //모든 극장 어노테이션 보여주기
        setTheaterAnnotaion(type: .all)
        
        //지도 시작 위치
        setRegionAndAnnotation(center: center)
        
    }
}


//MARK: CLLocationManager
extension TheaterViewController: CLLocationManagerDelegate {
    //사용자의 위치를 성공적으로 가지고 온 경우
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
        }
    }
    
    //사용자 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization() // 권한 설정이 바뀐 것만 인지하기 때문에 checkDevice 메서드를 실행해준다
    }
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkDeviceLocationAuthorization()
    }
}



//MARK: 위치,지도 관련 메서드
extension TheaterViewController {
    //지도의 중심 위치 잡기
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        //어노테이션 추가
        if center.latitude == 37.517829 && center.longitude == 126.886270 {
            let annotation = MKPointAnnotation()
            annotation.title = "기본 위치"
            annotation.coordinate = center
            mapView.addAnnotation(annotation)
        } else {
            let annotation = MKPointAnnotation()
            annotation.title = "내 위치"
            annotation.coordinate = center
            mapView.addAnnotation(annotation)
        }
    }
    
    //영화관 어노테이션 추가
    func setTheaterAnnotaion(type: TheaterType) {
        switch type {
        case .megaBox:
            mapView.removeAnnotations(mapView.annotations)

            for item in theaterList.mapAnnotations {
                if item.type == .megaBox {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                    annotation.title = item.location
                    mapView.addAnnotation(annotation)

                }
            }
        case .lotteCinema:
            mapView.removeAnnotations(mapView.annotations)

            for item in theaterList.mapAnnotations {
                if item.type == .lotteCinema {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                    annotation.title = item.location
                    mapView.addAnnotation(annotation)

                }
            }
        case .cgv:
            mapView.removeAnnotations(mapView.annotations)

            for item in theaterList.mapAnnotations {
                if item.type == .cgv {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                    annotation.title = item.location
                    mapView.addAnnotation(annotation)

                }
            }
        case .all:
            mapView.removeAnnotations(mapView.annotations)
            for item in theaterList.mapAnnotations {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)
                annotation.title = item.location
                mapView.addAnnotation(annotation)
            }
        }
    }
    
    // 기기 자체의 위치 서비스 권환 활성화 여부 확인
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                print("기기 자체 위치 서비스")
                print(authorization)
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
            } else {
                print("위치 서비스가 껴져있어서 위치 권한 요청을 못합니다.")
            }
        }
        
    }
    
    //권한 설정 여부에 따른 사용자 위치 확인
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("권한 상태", status)
        
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showRequestLocationSettingAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation() // 사용자의 위치 업데이트
        case .authorized:
            print("authorized")
        @unknown default:
            print("default")
        }
    }
    
    func showRequestLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 -> 개인정보 보호'에서 위치 서비스를 켜주세요!", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(appSetting)
            }
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

extension TheaterViewController {
    //영화관 선택 ActionSheet
    @objc func selectTheaterSheet() {
        print("clicked")
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for item in theaterTypeList {
            print(item)
            print(item.rawValue)
            actionSheet.addAction(UIAlertAction(title: item.rawValue, style: .default, handler: { UIAlertAction in
                print("\(item.rawValue)선택")
                self.setTheaterAnnotaion(type: item)
            }))
        }
//        let seeAll = UIAlertAction(title: "전체보기", style: .default) { _ in
//            self.setTheaterAnnotaion(type: .all)
//        }
        
//        actionSheet.addAction(seeAll)
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    //내 위치 버튼
    @objc func clickedMyLocation() {
        print("my loca clicked")
        checkDeviceLocationAuthorization()
        setRegionAndAnnotation(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270))
    }
}
