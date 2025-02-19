import SwiftUI
import CoreLocation
import NMapsMap

// SwiftUI에서 UIKit 기반 UIViewController 사용하기 위한 래퍼
struct NaverMapView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {}
}

// 위치 기능을 포함한 UIKit 기반 네이버 지도 컨트롤러
class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var naverMapView: NMFNaverMapView! // NMFNaverMapView 사용
    var marker = NMFMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네이버 지도 초기화 (NMFNaverMapView 사용)
        naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showZoomControls = true
        view.addSubview(naverMapView)
        
        // 위치 관리자 설정
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    // 위치 업데이트 처리
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        print("현재 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        // 지도 카메라를 현재 위치로 이동
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
        cameraUpdate.animation = .easeIn
        naverMapView.mapView.moveCamera(cameraUpdate)
        
        // 현재 위치에 마커 추가
        marker.position = NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
        marker.mapView = naverMapView.mapView
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }
}

struct ContentView: View {
    var body: some View {
        NaverMapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
