//
//  MainMoviesListInteractor.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

struct MainMoviesListInteractor {

   fileprivate let apiDataManager: TmdbApiDataManager
   fileprivate let disposeBag = DisposeBag()

   init(apiDataManager: TmdbApiDataManager) {
      self.apiDataManager = apiDataManager
   }
   
   //MARK: Output
   
   func getAllMovies() -> Observable<[Movie]> {
      return apiDataManager.discoverMovies()
   }
   
}
