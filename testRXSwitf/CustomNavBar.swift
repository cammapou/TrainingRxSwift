//
//  CustomNavBar.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomNavBar: UINavigationBar {
    
    func setNavBar() {
        self.translatesAutoresizingMaskIntoConstraints = false
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Test")

        navBar.setItems([navItem], animated: false)
    }
}
