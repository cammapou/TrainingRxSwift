//
//  CustomShearchBar.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomSearchBar: UISearchBar {
    
    func setupSearchBar() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.searchBarStyle = .prominent
        self.placeholder = " Search..."
        self.sizeToFit()
        self.isTranslucent = false
    }
}
