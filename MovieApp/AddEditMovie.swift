//
//  AddEditMovie.swift
//  MovieApp
//
//  Created by adol kazmy on 19/02/2021.
//

import UIKit
import RealmSwift


class AddEditMovie : UIViewController {
    
    //Outlets:
    @IBOutlet weak var movieNameTxt: UITextField!
    @IBOutlet weak var movieRateTxt: UITextField!
    @IBOutlet weak var movieTypePicker1: UIPickerView!
    @IBOutlet weak var movieTypePicker2: UIPickerView!
    @IBOutlet weak var movieTypePicker3: UIPickerView!
    @IBOutlet weak var movieImgLinkTxt: UITextField!
    @IBOutlet weak var uploadEditButton: UIButton!
    
    //variables:
    let realm = try! Realm()
    let types1 = [" ","Action","Comedy","Biography","Thriller","romantic","Adventure","Musical","Drama","Historical","Real Life","War","Horror","Sci-Fi"]
    let types2 = [" ","Action","Comedy","Biography","Thriller","romantic","Adventure","Musical","Drama","Historical","Real Life","War","Horror","Sci-Fi"]
    let types3 = [" ","Action","Comedy","Biography","Thriller","romantic","Adventure","Musical","Drama","Historical","Real Life","War","Horror","Sci-Fi"]
    let newMovie = MovieObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func uploadPressed(_ sender: Any) {
        
        newMovie.movieName = movieNameTxt.text!
        newMovie.movieRate = Float(Int(Float(movieRateTxt.text!) ?? 5.5))
        newMovie.movieImgLink = movieImgLinkTxt.text!
        save(movie: newMovie)
        navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    func save(movie: MovieObject) {
        do {
            try realm.write {
                realm.add(movie)
            }
        } catch {
            print("Error saving movie \(error)")
        }
        
    }
}

extension AddEditMovie : UIPickerViewDataSource , UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types1.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(types1[row])"
        } else if pickerView.tag == 2 {
            return types2[row]
        } else if pickerView.tag == 3 {
            return types3[row]
        }
        return "Empty"
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            newMovie.movieType1 = types1[row]
            print(types1[row])
        } else if pickerView.tag == 2 {
            newMovie.movieType2 = types2[row]
            print(types2[row])
        } else if pickerView.tag == 3 {
            newMovie.movieType3 = types3[row]
            print(types3[row])
        }
        
    }
}
