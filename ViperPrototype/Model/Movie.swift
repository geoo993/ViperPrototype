//
//  Movie.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation

struct Movie {
   
   private (set) var title: String
   private (set) var releaseDate: NSDate
   private (set) var posterPath: String
   private (set) var backdropPath: String
   
   init(title: String) {
      self.title = title
      releaseDate = NSDate(timeIntervalSince1970: 0)
      posterPath = ""
      backdropPath = ""
   }

   init?(jsonDictionary: [NSObject: AnyObject]) {
      
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"

      guard let title = jsonDictionary["original_title"] as? String,
         let releaseDateString = jsonDictionary["release_date"] as? String,
         let releaseDate = formatter.dateFromString(releaseDateString),
         let posterPath = jsonDictionary["poster_path"] as? String,
         let backdropPath = jsonDictionary["backdrop_path"] as? String else { return nil }
      
      self.title = title
      self.releaseDate = releaseDate
      self.posterPath = posterPath
      self.backdropPath = backdropPath
      
   }
   
   mutating func updatePosterPath(baseUrl: String) {
      posterPath = baseUrl + posterPath
   }

   mutating func updateBackdropPath(baseUrl: String) {
      backdropPath = baseUrl + backdropPath
   }

}