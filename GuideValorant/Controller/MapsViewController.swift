//
//  MapsViewController.swift
//  GuideValorant
//
//  Created by Romulo Oliveira Viganico on 19/08/20.
//  Copyright © 2020 Romulo Oliveira Viganico. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {
    
    var listMaps: [ContentList.Maps] = []
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .blue
        title = "maps"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension MapsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = listMaps[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let mapsDetailVC = UINavigationController(rootViewController: MapsViewController())
        present(mapsDetailVC, animated: true)
//        let vc = UIViewController()
//        vc.view.backgroundColor = .blue
//        navigationController?.pushViewController(vc, animated: true)
    }
}
