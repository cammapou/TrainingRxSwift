//
//  SearchBarTableViewCell.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class SearchBarTableViewCell: UITableViewCell {
    
    let label = CustomLabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell() {
        self.label.setupLabel(string: "")
        self.contentView.addSubview(label)
        self.setAnchor()
    }
    
    func setAnchor() {
        self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
}
