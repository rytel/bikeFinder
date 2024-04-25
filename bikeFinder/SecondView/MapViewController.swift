//
//  MapViewController.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 25/04/2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var stationInfoContainerView: UIView!
    
    var stationView: StationInfoView?
    var stationModel: StationModel
    let locationManager: CLLocationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stationView = createStationView()
        stationView?.setValues(stationModel: stationModel)
        stationInfoContainerView.layer.cornerRadius = 10
        localizeStation()
    }
    
    init(stationModel: StationModel) {
        self.stationModel = stationModel
        locationManager = CLLocationManager()
        super.init(nibName: "MapViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension MapViewController {
    func localizeStation() {
        mapView.showsUserLocation = true
        let station = MKPointAnnotation()
        station.coordinate = CLLocationCoordinate2D(latitude: stationModel.lat, longitude: stationModel.lon)
        mapView.addAnnotation(station)
        mapView.showAnnotations([station], animated: true)
    }
}

//MARK: UI
fileprivate extension MapViewController {
    func createStationView() -> StationInfoView {
        let stationView = StationInfoView(nibName: "StationInfoView", bundle: nil)
        stationInfoContainerView.addSubview(stationView.view)
        stationView.view.translatesAutoresizingMaskIntoConstraints = false
        stationView.view.topAnchor.constraint(equalTo: stationInfoContainerView.topAnchor).isActive = true
        stationView.view.bottomAnchor.constraint(equalTo: stationInfoContainerView.bottomAnchor, constant: -34.0).isActive = true
        stationView.view.leadingAnchor.constraint(equalTo: stationInfoContainerView.leadingAnchor).isActive = true
        stationView.view.trailingAnchor.constraint(equalTo: stationInfoContainerView.trailingAnchor).isActive = true
        return stationView
    }
}
