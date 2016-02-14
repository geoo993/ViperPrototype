//
//  MainMoviesListWireframe.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

struct MainMoviesListWireframe {

   static func presentMainMoviesListModule(window: UIWindow) {
      
      let mainMoviesListView = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MainMoviesListView") as! MainMoviesListView

      let apiService = TmdbApiService()
      let apiDataManager = TmdbApiDataManager(apiService: apiService)
      
      let mainMoviesListInteractor = MainMoviesListInteractor(apiDataManager: apiDataManager)
      mainMoviesListView.presenter = MainMoviesListPresenter(interactor: mainMoviesListInteractor, wireframe: MainMoviesListWireframe())

      if let navigationController = window.rootViewController as? UINavigationController {
         dispatch_async(dispatch_get_main_queue(), { () -> Void in
            navigationController.pushViewController(mainMoviesListView, animated: true)
         })
      }

   }
   
   func showDetail() {
      MovieDetailWireframe.presentMovieDetailModule(UIApplication.sharedApplication().keyWindow!)
   }
   
}