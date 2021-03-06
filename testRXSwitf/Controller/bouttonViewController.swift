//
//  bouttonViewController.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class bouttonViewController: UIViewController {

    let choix1 = CustomButton()
    let choix2 = CustomButton()
    let choix3 = CustomButton()
    let buttonNextPage = CustomButton()
    
    private let selectionnedVar =   BehaviorRelay<String>(value: "")
    
    var selectedCaratere: Observable<String> {
        return selectionnedVar.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.choix1.setButton(string: "chicken")
        self.choix2.setButton(string: "dog")
        self.choix3.setButton(string: "human")
        
        self.buttonNextPage.setButton(string: "Aller à la page suivante, clic ici")
        
        self.view.backgroundColor = .white

        self.addSubView()
        self.setAnchor()
        self.setNavigationBar()
        
        self.choix1.addTarget(.none, action: #selector(setButton1), for: .touchUpInside)
        self.choix2.addTarget(.none, action: #selector(setButton2), for: .touchUpInside)
        self.choix3.addTarget(.none, action: #selector(setButton3), for: .touchUpInside)
        self.buttonNextPage.addTarget(.none, action: #selector(setButton4), for: .touchUpInside)
    }
    
    func addSubView() {
        self.view.addSubview(choix1)
        self.view.addSubview(choix2)
        self.view.addSubview(choix3)
        self.view.addSubview(buttonNextPage)
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 70))
        let navItem = UINavigationItem(title: "")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.reply, target: nil, action: #selector(done))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    
    @objc private func setButton1() {
        guard let charactereName = choix1.titleLabel?.text else {return}
        selectionnedVar.accept(charactereName)
    }
    @objc private func setButton2() {
        guard let charactereName = choix2.titleLabel?.text else {return}
        selectionnedVar.accept(charactereName)
     }
    @objc private func setButton3() {
        guard let charactereName = choix3.titleLabel?.text else {return}
        selectionnedVar.accept(charactereName)
     }

    @objc private func setButton4() {
        let newViewController = SearchBarViewController()
        newViewController.modalPresentationStyle = .fullScreen
        present(newViewController, animated: true, completion: nil)
     }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    func setAnchor() {
        self.choix1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        self.choix1.trailingAnchor.constraint(equalTo: self.choix2.leadingAnchor, constant: -20).isActive = true
        
        self.choix2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        self.choix2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        self.choix3.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        self.choix3.leadingAnchor.constraint(equalTo: self.choix2.trailingAnchor, constant: 20).isActive = true
        self.buttonNextPage.topAnchor.constraint(equalTo: self.choix2.bottomAnchor, constant: 40).isActive = true
        self.buttonNextPage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
