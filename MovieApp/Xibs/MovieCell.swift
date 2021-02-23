//
//  MovieCell.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import UIKit
import Kingfisher
import RealmSwift

class MovieCell: UITableViewCell {
    
    //Outlets :
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var movieTypeLbl: UILabel!
    @IBOutlet weak var movieRateLbl: UILabel!

   //Variables :
    var movieObj : MovieObject?
    var movies : [MovieObject] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func lblBgChanger(rate : Float) {
        if rate <= 5 && rate > 3 {
            movieRateLbl.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            movieRateLbl.textColor = UIColor.black
        } else if rate <= 3 {
            movieRateLbl.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.9515245783, blue: 0, alpha: 1)
            movieRateLbl.textColor = UIColor.black
        }else if rate > 5 && rate < 8 {
            movieRateLbl.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            movieRateLbl.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            movieRateLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    func configureCell(movieObject: MovieObject) {
        movieLbl.text = movieObject.movieName
        if let url = URL(string: movieObject.movieImgLink){
            let placeholder = UIImage(named: "inside")
            let options : KingfisherOptionsInfo = [.transition(.fade(0.3))]
        movieImg.kf.setImage(with: url , placeholder: placeholder , options: options )
        }
//        cell.movieImg.image = movies[indexPath.row].movieImgName
        movieTypeLbl.text = "\(movieObject.movieType1) \(movieObject.movieType2 ) \(movieObject.movieType3)"
        movieRateLbl.text = String(movieObject.movieRate )
        
        
    }

}
