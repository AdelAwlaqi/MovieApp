//
//  SearchVC.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import UIKit


class SearchVC : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    // variables:
    var movieObj : MovieObject?
    var movies : [MovieObject] = []
    
    
    // outlets:
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!{
        didSet{
            tableView.delegate = self ; tableView.dataSource = self
            tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieCell {
            
            return cell
        }
        return UITableViewCell()
    }

    
}

