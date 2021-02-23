//
//  SearchType.swift
//  MovieApp
//
//  Created by adol kazmy on 22/02/2021.
//

import UIKit

protocol SelectTypeDelegate {
    func selectedType(type : String)
}

class SearchType : UIViewController {
    
    
    //variables:
    var type = ""
    var delegate : SelectTypeDelegate!
    

    
    
    
    @IBAction func typePressed(_ sender: UIButton) {
        if sender.tag == 1 {
           type = "Action"
            print(delegate.selectedType(type: type))
            notEmpty()
        } else if sender.tag == 2 {
            type = "Comedy"
            notEmpty()
        } else if sender.tag == 3 {
            type = "Biography"
            notEmpty()
        } else if sender.tag == 4 {
            type = "Thriller"
            notEmpty()
        } else if sender.tag == 5 {
            type = "Romantic"
            notEmpty()
        } else if sender.tag == 6 {
            type = "Adventure"
            notEmpty()
        } else if sender.tag == 7 {
            type = "Musical"
            notEmpty()
        } else if sender.tag == 8  {
            type = "Drama"
            notEmpty()
        } else if sender.tag == 9 {
            type = "Historical"
            notEmpty()
        } else if sender.tag == 10 {
            type = "Real Life"
            notEmpty()
        } else if sender.tag == 11 {
            type = "War"
            notEmpty()
        } else if sender.tag == 12 {
            type = "Horror"
            notEmpty()
        } else if sender.tag == 13 {
            type = "Sci-Fi"
            notEmpty()
        }
        
    }
    
    
    func notEmpty() {
        delegate.selectedType(type: type)
        self.dismiss(animated: true, completion: nil)
         }
   }
