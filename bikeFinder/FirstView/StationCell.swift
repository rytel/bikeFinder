//
//  StationCell.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import UIKit

class StationCell: UITableViewCell {
    static let identifier: String = "StationCellIdentifier"
    var stationView: StationInfoView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stationView = createStationView()
    }
    
    func setValues(stationModel: StationModel) {
        stationView?.setValues(stationModel: stationModel)
    }
}


//MARK: UI
fileprivate extension StationCell {
    func createStationView() -> StationInfoView {
        let stationView = StationInfoView(nibName: "StationInfoView", bundle: nil)
        stationView.view.layer.cornerRadius = 10
        contentView.addSubview(stationView.view)
        stationView.view.translatesAutoresizingMaskIntoConstraints = false
        stationView.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        stationView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        stationView.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        stationView.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        return stationView
    }
}
