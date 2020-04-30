//
//  ExtensionTableView.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

extension SearchBarViewController: UITableViewDataSource {
    
    func setupAnchorTableView() {
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCities.count
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: Int = 0
        if tableView == self.tableView {
            height = 40
        }
        return CGFloat(height)
        
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdTa, for: indexPath) as? SearchBarTableViewCell {
                cell.setupCell()
                cell.label.text = shownCities[indexPath.row]
                return cell
            }
        }
        return UITableViewCell()
    }
}
