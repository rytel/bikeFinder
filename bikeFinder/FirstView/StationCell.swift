//
//  StationCell.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import UIKit

class StationCell: UITableViewCell {
    static let identifier: String = "StationCellIdentifier"
    
    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var range: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var bikesNumber: UILabel!
    @IBOutlet weak var placesNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        customBackgroundView.layer.borderWidth = 0.0
        customBackgroundView.layer.cornerRadius = 10
//        customBackgroundView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setValues(stationModel: StationModel) {
        self.name.text = stationModel.name
        self.bikesNumber.text = String( stationModel.bikesNumber)
        self.placesNumber.text = String(stationModel.freePlacesNumber)
    }
}
