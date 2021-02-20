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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        tableView.separatorStyle = .none
        tableView.reloadData()
        
        
//        movies = [ MovieObject(movieName: "A Beautiful Mind", movieRate: 8.2, movieType1: "Biography", movieType2: ", Drama", movieType3: " ", movieImgLink: "https://amblin.com/wp-content/uploads/2018/09/beautifulmind_2001_photo_1920x1080-1_hero-1920x1080.jpg"),
//                   MovieObject(movieName: "Finding Nemo", movieRate: 8.1, movieType1: "Animation", movieType2: ", Adventure", movieType3: ", Comedy", movieImgLink: "https://miro.medium.com/max/1088/0*N-d5irFhX--0VA1y" )
                   //,
//                   MovieObject(movieName: "When a Stranger Calls", movieRate: 5.1, movieType1: "Horror", movieType2: ", Thriller", movieType3: " ", movieImgName: UIImage(named: "when")!),
//                   MovieObject(movieName: "the pursuit of happyness", movieRate: 8.0, movieType1: "Biography", movieType2: ", Drama", movieType3: "", movieImgName: UIImage(named: "pursuit")!),
//                   MovieObject(movieName: "Inside Out", movieRate: 8.2, movieType1: "Animation", movieType2: ", Adventure", movieType3: ", Comedy", movieImgName: UIImage(named: "inside")!),
//                   MovieObject(movieName: "Inception", movieRate: 9, movieType1: "Drama", movieType2: ", Action", movieType3: ", Adventure", movieImgName: UIImage(named: "inception")!)
//        ]
        }
    
    @IBAction func addPressed(_ sender: Any) {
        performSegue(withIdentifier: "toAdd", sender: self)
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

    func loadCategories() {
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
                       self.performSegue(withIdentifier: "toAdd", sender: nil)
                   }
        edit.backgroundColor = #colorLiteral(red: 0, green: 0.5452948213, blue: 0.5925067663, alpha: 1)
        
        return [delete,edit]
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
