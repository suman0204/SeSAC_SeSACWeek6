//
//  LocationViewController.swift
//  SeSACWeek6
//
//  Created by 홍수만 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 import
import MapKit
import SnapKit

class LocationViewController: UIViewController {

    //2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    
    let mapview = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapview)
        mapview.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        //Info.plist <<< 얼럿
        //Info.plist에서 설정해준 값과 대응하는 녀석을 선언해준다
//        locationManager.requestWhenInUseAuthorization()
        
        checkDeviceLocationAuthorization()
    }
    
    func setRegionAndAnnotation() {
        
        //지도 중심 기반으로 보여질 범위 설정
        let region = MKCoordinateRegion(center: <#T##CLLocationCoordinate2D#>, latitudinalMeters: <#T##CLLocationDistance#>, longitudinalMeters: <#T##CLLocationDistance#>)
    }
    
    //iOS 기기 자체에서의 위치 서비스 활성화 체크
    func checkDeviceLocationAuthorization() {
        
        //iOS 위치 서비스 활성화 체크
        DispatchQueue.global().async {
            
            if CLLocationManager.locationServicesEnabled() { //위치 서비스 켰는지 확인
                
                //현재 사용자의 위치 권한 상태를 가지고 옴
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                self.checkCurrentLocationAuthorization(status: authorization)
                
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
            
        }
        
    }
    
    // 사용자의 현재 위치를 체크
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check", status)
        switch status {
        case .notDetermined://최소로 사용자가 앱을 켰을 때
            locationManager.desiredAccuracy = kCLLocationAccuracyBest //위치 기준 잡아주는 (각 기종에 알맞게 설정됨)
            locationManager.requestWhenInUseAuthorization() // 위치 서비스 설정 팝업 띄워주는 코드
            
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse: //권한이 허용됐을 때
            print("authorizedWhenInUse")
            //didUpdateLocations 실행함
            locationManager.startUpdatingLocation() // 권한이 허용됐을 때 사용자의 위치를 업데이트 해줘라
        case .authorized:
            print("authorized")
        @unknown default: //위치 권한 종류가 더 생길 가능성 대비
            print("default")
        }
    }
    
}


//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
 
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    //한 번만 실행되지 않는다, iOS 위치 기기가 자체적으로 판단해서 위치 업데이트가 필요한 시점에 알아서 여러번 호출 된다
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("===", locations)
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
        }
        
        //위치 업데이트를 한 번만 하고 싶을 때 사용
        locationManager.stopUpdatingLocation()
    }
    
    //6. 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    //허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    //iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization() // 권한 설정이 바뀐 것만 인지하기 때문에 checkDevice 메서드를 실행해준다
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}
