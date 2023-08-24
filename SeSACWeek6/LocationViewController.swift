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
    let cafeButton = UIButton()
    let foodButton = UIButton()
    
    //
    let num = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapview)
        mapview.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        
        view.addSubview(cafeButton)
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        cafeButton.backgroundColor = .red
        cafeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(120)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        
        view.backgroundColor = .white
        
        //3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        //Info.plist <<< 얼럿
        //Info.plist에서 설정해준 값과 대응하는 녀석을 선언해준다
//        locationManager.requestWhenInUseAuthorization()
        
        checkDeviceLocationAuthorization()
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        setRegionAndAnnotation(center: center)
        setAnnotation(type: 0)
    }
    
    @objc func cafeButtonClicked() {
        let num2 = Int.random(in: 1...100) //scope
        print(num, num2)
        
        setAnnotation(type: 1) // 카페: 1 , default: 0
        print("==")
    }
    
    func setAnnotation(type: Int) {
//        37.517857, 126.886714 // 컴포즈
//        37.517746, 126.887131//오밥
        
        
        let annotaion1 = MKPointAnnotation()
        annotaion1.coordinate = CLLocationCoordinate2D(latitude: 37.517857, longitude: 126.886714)
        
        let annotaion2 = MKPointAnnotation()
        annotaion2.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131)
        
        
        if type == 0 { //viewDidLoad에서
            mapview.addAnnotations([annotaion1,annotaion2])
        } else if type == 1 { //cafebutton 눌렀을 때
            
            //아래 코드가 동작하지 않는 이유 - scope
            mapview.removeAnnotation(annotaion1) // X
            
            mapview.removeAnnotations(mapview.annotations)
            mapview.addAnnotations([annotaion2])
        }
        
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        //지도 중심 기반으로 보여질 범위 설정
//        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        let region = MKCoordinateRegion(center:  center, latitudinalMeters: 400, longitudinalMeters: 400)
        mapview.setRegion(region, animated: true)
        
        //지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "청년취업사관학교"
        annotation.coordinate = center
        mapview.addAnnotation(annotation)
        
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정 > 개인정보 보호'에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            
            // 설정에서 직접적으로 앱 설정 화면에 들어간적이 없다면, 한 번도 설정 앱에 들어가지 않았거나, 막 다운 받은 앱이라면 설정에 메인 화면까지만 이동함
            // 설정 페이지로 넘어갈지, 앱의 상세 설정 페이지까지 넘아갈지 결정할 수 없다
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
            
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        
        present(alert, animated: true)
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
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
                
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
            showLocationSettingAlert()
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
            setRegionAndAnnotation(center: coordinate)
            //ex.날씨 API 호출
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


extension LocationViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
}
