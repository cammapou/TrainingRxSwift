//
//  SearchBarViewController.swift
//  testRXSwitf
//
//  Created by Ddales on 27/04/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchBarViewController: UIViewController, UISearchResultsUpdating {
    
    let cellIdTa = "searchBarViewCell"
    let disposeBag = DisposeBag()

    let searchBar = CustomSearchBar()
    var allCities = ["New York", "London", "Olso", "Warsaw", "Berlin", "Praga"]
    var shownCities = [String]()
    
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.isEditing = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    var navigationBar: UINavigationBar {
        let screenSize: CGRect = UIScreen.main.bounds
        let navItem = UINavigationItem(title: "")
        let searchController = UISearchController(searchResultsController: nil)
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: screenSize.width, height: 70))
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.reply, target: nil, action: #selector(done))
        navItem.leftBarButtonItem = doneItem
        
        searchController.searchResultsUpdater = self
        self.definesPresentationContext = true

        navItem.titleView = searchController.searchBar

        searchController.hidesNavigationBarDuringPresentation = false
        navBar.setItems([navItem], animated: false)
        return navBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(navigationBar)
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.register(SearchBarTableViewCell.self, forCellReuseIdentifier: cellIdTa)

        self.setupAnchorTableView()
        self.setup()
        
    }
    
    func setup() {
        tableView.dataSource = self
        searchBar
            .rx.text // Observable property thanks to RxCocoa
            .orEmpty // Make it non-optional
           // .debounce(, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
            .distinctUntilChanged() // If they didn't occur, check if the new value is the same as old.
            .filter { !$0.isEmpty } // If the new value is really new, filter for non-empty query.
            .subscribe(onNext: { [unowned self] query in // Here we subscribe to every new value, that is not empty (thanks to filter above).
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                self.tableView.reloadData() // And reload table view data.
            })
            .disposed(by: disposeBag) // Don't forget to add this to disposeBag. We want to dispose it on deinit.
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
     //   searchController = entries.filter({ (title: String, image: String) -> Bool in
       //     let match = title.range(of: searchText, options: .caseInsensitive)
            // Return the tuple if the range contains a match.
      //      return match != nil
      //  })
    }

    func setAnchor() {
        self.searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        self.searchBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.searchBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
