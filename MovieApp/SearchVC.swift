//
//  SearchVC.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import UIKit
import RealmSwift


class SearchVC : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    // variables:
    var movieObj : MovieObject?
    var movies : Results<MovieObject>?
    let realm = try! Realm()
    
    
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
//        searchBar.delegate = self
        loadMovies()
        tableView.separatorStyle = .none
        tableView.reloadData()
             }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.lblBgChanger(rate: movies![indexPath.row].movieRate)
        cell.configureCell(movieObject: movies![indexPath.row])
        return cell
    }

    func loadMovies() {
        movies  = realm.objects(MovieObject.self)
        tableView.reloadData()
    }
    




}
extension SearchVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        movies = movies?.filter("movieName CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "movieName", ascending: true)
                    
                    tableView.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadMovies()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        } else if searchBar.text!.count > 0 {
            movies = movies?.filter("movieName CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "movieName", ascending: true)
                        
            tableView.reloadData()
        }
    }
}
