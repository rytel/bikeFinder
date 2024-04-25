//
//  StationInfoView.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 25/04/2024.
//

import UIKit

class StationInfoView: UIViewController {

    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var range: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var bikesNumber: UILabel!
    @IBOutlet weak var placesNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customBackgroundView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    func setValues(stationModel: StationModel) {
        self.name.text = stationModel.name
        self.bikesNumber.text = String(stationModel.status!.bikeCount)
        self.placesNumber.text = String(stationModel.status!.dockCount)
        self.address.text = stationModel.address
    }
}
