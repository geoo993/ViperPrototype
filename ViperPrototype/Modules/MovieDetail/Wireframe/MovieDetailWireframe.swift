//
//  MovieDetailWireframe.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

struct MovieDetailWireframe {

   static func presentMovieDetailModule(_ window: UIWindow) {
      let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailView")
      if let navController = window.rootViewController as? UINavigationController {
         navController.pushViewController(controller, animated: true)
      }
   }

}
