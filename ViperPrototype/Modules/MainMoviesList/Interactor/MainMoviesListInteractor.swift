//
//  MainMoviesListInteractor.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct MainMoviesListInteractor {

   private var apiDataManager: ApiDataManager
   private let disposeBag = DisposeBag()
   
   init(apiDataManager: ApiDataManager) {
      self.apiDataManager = apiDataManager
   }
   
   //MARK: Output
   
   func getAllMovies() -> Observable<[Movie]> {
      return apiDataManager.getAllMovies()
   }
   
}