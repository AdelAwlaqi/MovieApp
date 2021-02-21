//
//  InfoVC.swift
//  MovieApp
//
//  Created by adol kazmy on 21/02/2021.
//

import UIKit
import Kingfisher

class InfoVC : UIViewController {
    
    //outlets:
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieType: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    //variables:
    var movieObj = MovieObject()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayInfo()
    }
    
    
    
    
    func displayInfo() {
        
        movieName.text = movieObj.movieName
        movieType.text = "\(movieObj.movieType1) \(movieObj.movieType2) \(movieObj.movieType3)"
        movieRate.text = movieObj.movieRate.description
        print("//////////////////////////////////////////////\(movieRate.text)")
        if let url = URL(string: movieObj.movieImgLink){
            let placeholder = UIImage(named: "placeholder")
            let options : KingfisherOptionsInfo = [.transition(.fade(0.3))]
        movieImg.kf.setImage(with: url , placeholder: placeholder , options: options )
        }
        
    }
    
}
