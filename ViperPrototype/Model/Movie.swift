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
   
   init(title: String) {
      self.title = title
      self.releaseDate = NSDate(timeIntervalSince1970: 0)
   }

   init?(jsonDictionary: [NSObject: AnyObject]) {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"

      guard let title = jsonDictionary["original_title"] as? String,
         let releaseDateString = jsonDictionary["release_date"] as? String,
         let releaseDate = formatter.dateFromString(releaseDateString) else {
            
         return nil
            
      }
      
      self.title = title
      self.releaseDate = releaseDate
      
   }
}