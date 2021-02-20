//
//  MovieObject.swift
//  MovieApp
//
//  Created by adol kazmy on 18/02/2021.
//

import Foundation
import RealmSwift


class MovieObject : Object {
    
    @objc dynamic var movieName : String = ""
    @objc dynamic var movieRate : Float = 0
    @objc dynamic var movieType1 : String = ""
    @objc dynamic var movieType2 : String = ""
    @objc dynamic var movieType3 : String = ""
    @objc dynamic var movieImgLink : String = ""

    
//    init(movieName: String,
//         movieRate: Float,
//         movieType1: String,
//         movieType2: String,
//         movieType3: String,
//         movieImgLink: String) {
//        self.movieName = movieName
//        self.movieRate = movieRate
//        self.movieType1 = movieType1
//        self.movieType2 = movieType2
//        self.movieType3 = movieType3
//        self.movieImgLink = movieImgLink
//    }

//    var movies = [ MovieObject(movieName: "A Beautiful Mind", movieRate: 8.2, movieType1: "Biography", movieType2: ", Drama", movieType3: " ", movieImgName: UIImage(named: "beatiful")!),
//                   MovieObject(movieName: "Finding Nemo", movieRate: 8.1, movieType1: "Animation", movieType2: ", Adventure", movieType3: ", Comedy", movieImgName: UIImage(named: "beatiful")!),
//                   MovieObject(movieName: "When a Stranger Calls", movieRate: 5.1, movieType1: "Horror", movieType2: ", Thriller", movieType3: " ", movieImgName: UIImage(named: "beatiful")!),
//                   MovieObject(movieName: "the pursuit of happyness", movieRate: 8.0, movieType1: "Biography", movieType2: ", Drama", movieType3: "", movieImgName: UIImage(named: "beatiful")!),
//                   MovieObject(movieName: "Inside Out", movieRate: 8.2, movieType1: "Animation", movieType2: ", Adventure", movieType3: ", Comedy", movieImgName: UIImage(named: "beatiful")!),
//                   MovieObject(movieName: "Inception", movieRate: 9, movieType1: "Drama", movieType2: ", Action", movieType3: ", Adventure", movieImgName: UIImage(named: "beatiful")!) ]
//    
}
