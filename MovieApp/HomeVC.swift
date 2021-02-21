//
//  HomeVC.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import UIKit
import Kingfisher
import RealmSwift
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self ; tableView.dataSource = self
            tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    
    var movieObj : MovieObject?
//    var movies : [MovieObject] = []
    var movies : Results<MovieObject>?
    let realm = try! Realm()
    var selectedMovie : MovieObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMovies()
        tableView.separatorStyle = .none
        tableView.reloadData()

        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: NSNotification.Name("reloadData"), object: nil)


    }
    

    @objc func reloadData() {
        movies = nil
        tableView.reloadData()
        loadMovies()

    }

    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? InfoVC {
            destinationVC.movieObj = selectedMovie!
        }
        if let destinationVC2 = segue.destination as? AddEditMovie {
            destinationVC2.selectedMovie = selectedMovie
        }
    }
    
   
    //MARK: - Delete Data From Swipe
    
     func updateModel(at indexPath: IndexPath) {

        if let movieForDeletion = self.movies?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(movieForDeletion)
                    tableView.reloadData()
                }
            } catch {
                print("Error deleting category, \(error)")
            }
        }
    }
    //MARK: - Data Manipulation Methods

    func loadMovies() {
        movies  = realm.objects(MovieObject.self)
        tableView.reloadData()
        
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            updateModel(at: indexPath)
        }
    }
    
    
    //MARK: - اضافة ازرار واوامر التعامل مع الخليه
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "!حذف") { (action, indexPath) in
                // delete item at indexPath
            self.updateModel(at: indexPath)
            }
        let edit = UITableViewRowAction(style: .normal, title: "تعديل") { (action, indexPath) in
            self.selectedMovie = self.movies![indexPath.row]
            self.performSegue(withIdentifier: "toAdd", sender: nil)
            
                   }
        edit.backgroundColor = #colorLiteral(red: 0, green: 0.5452948213, blue: 0.5925067663, alpha: 1)
        
        return [delete,edit]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedMovie = movies![indexPath.row]
        performSegue(withIdentifier: "toInfo", sender: self)
    }
    
    //MARK: - الاذونات للتعامل مع مكتبة التابل فيو
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.lblBgChanger(rate: movies![indexPath.row].movieRate)
        cell.configureCell(movieObject: movies![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
