//
//  CustomLabel.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    func setupLabel(string: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.text = "Vous avez choisie \(string) "
    }
}
