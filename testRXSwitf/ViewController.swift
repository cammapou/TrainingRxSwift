//
//  ViewController.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let label = CustomLabel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.label.setupLabel(string: "...")
        
        self.view.addSubview(label)
        self.setAnchor()
        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 70))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: nil, action: #selector(done))
        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }

    @objc func done() {
        let viewController = bouttonViewController()
        viewController.modalPresentationStyle = .fullScreen
       
        viewController.selectedCaratere
            .subscribe(onNext: {  [weak self] charatere in
                self?.label.setupLabel(string: charatere)
            }).disposed(by: disposeBag)
       
        present(viewController, animated: true, completion: nil)
    }

    func setAnchor() {
        
    //    self.navBar.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    //    self.navBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        self.label.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        self.label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

    }
}

