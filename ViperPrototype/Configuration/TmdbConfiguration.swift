//
//  TmdbConfiguration.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation

struct TmdbConfiguration {
   
   let imagesBaseUrl: String
   let posterSizes: [String]
   let backdropSizes: [String]
 
   init?(jsonDictionary: [AnyHashable: Any]) {
      
      guard let images = jsonDictionary["images"] as? [AnyHashable: Any],
         let baseUrl = images["base_url"] as? String,
         let posterSizes = images["poster_sizes"] as? [String],
         let backdropSizes = images["backdrop_sizes"] as? [String] else { return nil }

      self.imagesBaseUrl = baseUrl
      self.posterSizes = posterSizes
      self.backdropSizes = backdropSizes

   }
   
}
