//
//  MainMoviesListWireframe.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

struct MainMoviesListWireframe {

   static func presentMainMoviesListModule(_ window: UIWindow) {
      
      let mainMoviesListView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMoviesListView") as! MainMoviesListView

      let apiService = TmdbApiService()
      let apiDataManager = TmdbApiDataManager(apiService: apiService)
      
      let mainMoviesListInteractor = MainMoviesListInteractor(apiDataManager: apiDataManager)
      mainMoviesListView.presenter = MainMoviesListPresenter(interactor: mainMoviesListInteractor, wireframe: MainMoviesListWireframe())

      if let navigationController = window.rootViewController as? UINavigationController {
         DispatchQueue.main.async(execute: { () -> Void in
            navigationController.pushViewController(mainMoviesListView, animated: true)
         })
      }

   }
   
   func showDetail() {
      MovieDetailWireframe.presentMovieDetailModule(UIApplication.shared.keyWindow!)
   }
   
}
