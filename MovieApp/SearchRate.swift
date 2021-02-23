//
//  SearchRate.swift
//  MovieApp
//
//  Created by adol kazmy on 23/02/2021.
//

import UIKit

protocol SelectRateDelegate {
    func selectedRate(SelectedRate : String)
}

class SearchRate : UIViewController {
    
    
    //variables:
    var rate : String?
    var delegate : SelectRateDelegate!
    

    
    
    
    @IBAction func typePressed(_ sender: UIButton) {
        if sender.tag == 1 {
           rate = "1"
            notEmpty()
        } else if sender.tag == 2 {
            rate = "2"
            notEmpty()
        } else if sender.tag == 3 {
            rate = "3"
            notEmpty()
        } else if sender.tag == 4 {
            rate = "4"
            notEmpty()
        } else if sender.tag == 5 {
            rate = "5"
            notEmpty()
        } else if sender.tag == 6 {
            rate = "6"
            notEmpty()
        } else if sender.tag == 7 {
            rate = "7"
            notEmpty()
        } else if sender.tag == 8  {
            rate = "8"
            notEmpty()
        } else if sender.tag == 9 {
            rate = "9"
            notEmpty()
        } else if sender.tag == 10 {
            rate = "10"
            notEmpty()
      }
    }
    
    func notEmpty() {

        delegate.selectedRate(SelectedRate: rate!)
        self.dismiss(animated: true, completion: nil)
         }
   }
