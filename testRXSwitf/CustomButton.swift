//
//  CustomButton.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    func setButton(string: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(string, for: .normal)
        self.setTitleColor(.black, for: .normal)
    }
}
