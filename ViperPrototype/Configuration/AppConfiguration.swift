//
//  AppConfiguration.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation

class AppConfiguration {
   
   private (set) var tmdbConfiguration: TmdbConfiguration?
   
   static let sharedInstance = AppConfiguration()
   
   var posterBasePath: String {
      return tmdbConfiguration!.imagesBaseUrl + tmdbConfiguration!.posterSizes[tmdbConfiguration!.posterSizes.count-2]
   }

   var backdropBasePath: String {
      return tmdbConfiguration!.imagesBaseUrl + tmdbConfiguration!.backdropSizes[tmdbConfiguration!.backdropSizes.count-2]
   }

   func setTmdbConfiguration(configuration: TmdbConfiguration) {
      tmdbConfiguration = configuration
   }
   
}