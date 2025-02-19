import SwiftUI
import CoreLocation
import NMapsMap

struct NaverMapView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {}
}

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var naverMapView: NMFNaverMapView!
    var marker = NMFMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverMapView = NMFNaverMapView(frame: view.frame)
        naverMapView.showZoomControls = true
        view.addSubview(naverMapView)
        

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
    
 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        print("현재 위치: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: location.coordinate.latitude, lng: location.coordinate.longitude))
        cameraUpdate.animation = .easeIn
        naverMapView.mapView.moveCamera(cameraUpdate)
        
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
