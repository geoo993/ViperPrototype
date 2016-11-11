//
//  Movie.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation

struct Movie {
   
   fileprivate (set) var title: String
   fileprivate (set) var releaseDate: Date
   fileprivate (set) var posterPath: String
   fileprivate (set) var backdropPath: String
   
   init(title: String) {
      self.title = title
      releaseDate = Date(timeIntervalSince1970: 0)
      posterPath = ""
      backdropPath = ""
   }

   init?(jsonDictionary: [AnyHashable: Any]) {
      
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"

      guard let title = jsonDictionary["original_title"] as? String,
         let releaseDateString = jsonDictionary["release_date"] as? String,
         let releaseDate = formatter.date(from: releaseDateString),
         let posterPath = jsonDictionary["poster_path"] as? String,
         let backdropPath = jsonDictionary["backdrop_path"] as? String else { return nil }
      
      self.title = title
      self.releaseDate = releaseDate
      self.posterPath = posterPath
      self.backdropPath = backdropPath
      
   }
   
   mutating func updatePosterPath(_ baseUrl: String) {
      posterPath = baseUrl + posterPath
   }

   mutating func updateBackdropPath(_ baseUrl: String) {
      backdropPath = baseUrl + backdropPath
   }

}
