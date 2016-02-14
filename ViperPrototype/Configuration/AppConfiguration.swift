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
   
   func setTmdbConfiguration(configuration: TmdbConfiguration) {
      tmdbConfiguration = configuration
   }
   
}