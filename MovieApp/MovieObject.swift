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

}
//extension MovieObject: Equatable {
//    static func ==(lhs: MovieObject, rhs: MovieObject) -> Bool {
//        return lhs.movieName == rhs.movieName
//    }
//}
