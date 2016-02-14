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
 
   init?(jsonDictionary: [NSObject: AnyObject]) {
      
      guard let images = jsonDictionary["images"] as? [NSObject: AnyObject],
         baseUrl = images["base_url"] as? String else { return nil }

      self.imagesBaseUrl = baseUrl

   }
   
}