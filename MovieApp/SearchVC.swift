//
//  SearchVC.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import UIKit
import RealmSwift


class SearchVC : UIViewController , UITableViewDelegate , UITableViewDataSource, SelectTypeDelegate, SelectRateDelegate {
    
    func selectedRate(SelectedRate: String) {
        selectedRate = Float(SelectedRate)
        print("\(selectedRate)Im SearchVC //////")
        loadMovies()
        movies = movies?.filter("movieRate == %d", selectedRate)
        print(movies?.count)
        
        tableView.reloadData()
    }
    
    func selectedType(type: String) {
        selectedType = type
        let predict = NSPredicate.init(format: "movieType1 == %@", selectedType as! CVarArg)
        let predict2 = NSPredicate.init(format: "movieType2 == %@", selectedType as! CVarArg)
        let predict3 = NSPredicate.init(format: "movieType3 == %@", selectedType as! CVarArg)
        let query = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.or, subpredicates: [predict,predict2,predict3])
        movies = realm.objects(MovieObject.self).filter(query)
        tableView.reloadData()
    }
    
    
    // variables:
    var movieObj : MovieObject?
    var movies : Results<MovieObject>?
    let realm = try! Realm()
    @IBOutlet weak var typeButton: UIBarButtonItem!
    var selectedType : String?
    var selectedRate : Float?
    
    
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
    
    
    @IBAction func btPressed(_ sender: Any) {
        performSegue(withIdentifier: "toType", sender: self)
    }
    
    
    @IBAction func ratePressed(_ sender: Any) {
        performSegue(withIdentifier: "toRate", sender: self)
    }
    
    
//    func changetitle() {
//        let item = self.navigationItem.rightBarButtonItem!
//        let button = item.customView as! UIButton
//        button.setTitle("البحث بنوع الفيلم", for: .normal)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SearchType {
            destinationVC.delegate = self
        }
        if let destinationVC2 = segue.destination as? SearchRate {
            destinationVC2.delegate = self
            print("Im Delegate")
        }
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
