//
//  ViewController.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import UIKit

class ViewController: UIViewController {

    var models: [ApiStationInformation] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(
            UINib(nibName: "StationCell", bundle: nil),
            forCellReuseIdentifier: StationCell.identifier
        )
        self.navigationController?.navigationBar.backgroundColor = .systemIndigo
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3 //models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationCell.identifier, for: indexPath) as? StationCell else {
            return UITableViewCell()
        }
        cell.name.text = "plac asd"
        cell.bikesNumber.text = "1"
        cell.placesNumber.text = "2"
        
        return cell
    }
}
