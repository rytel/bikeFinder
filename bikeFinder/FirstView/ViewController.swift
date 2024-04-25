//
//  ViewController.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 23/04/2024.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var model: [StationModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            model = await CoreDataManager.fetchDataFromServer()
            tableView.reloadData()
        }
        tableViewConfig()
        setNavBar()
    }
}

fileprivate extension ViewController {
    func tableViewConfig() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "StationCell", bundle: nil),
            forCellReuseIdentifier: StationCell.identifier
        )
    }
}

//MARK: table view delegate/datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationCell.identifier, for: indexPath) as? StationCell else {
            print("Cell reuse failure")
            return UITableViewCell()
        }
        cell.setValues(stationModel: model[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MapViewController(stationModel: model[indexPath.row])
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: UI
fileprivate extension ViewController {
    func setNavBar() {
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = .white
    }
}
