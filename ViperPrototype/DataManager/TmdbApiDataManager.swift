//
//  TmdbApiDataManager.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct TmdbApiDataManager {

   private var apiService: TmdbApiService
   private let disposeBag = DisposeBag()

   init(apiService: TmdbApiService) {
      self.apiService = apiService
   }
   
   func discoverMovies() -> Observable<[Movie]> {

      return Observable.create { observer in
      
         let discover = self.apiService.discoverMovies()
         discover.subscribeNext { (dictionary) -> Void in
            
            if let jsonMovies = dictionary as? [NSObject: AnyObject] {
               var movies = [Movie]()
               for jsonMovie in jsonMovies["results"] as! [[NSObject: AnyObject]] {
                  if let movie = Movie(jsonDictionary: jsonMovie) {
                     movies.append(movie)
                  }
               }
               observer.onNext(movies)
            }
            
            }.addDisposableTo(self.disposeBag)
         discover.subscribeError({ (error) -> Void in
            print(error)
         }).addDisposableTo(self.disposeBag)

         return AnonymousDisposable {}
         
      }
      
   }
   
   func configurations() -> Observable<TmdbConfiguration> {
   
      return Observable.create { observer in
         
         let configurationObservable = self.apiService.configurations()
         configurationObservable.subscribeNext { (configuration) -> Void in

            if let tmdbConfiguration = TmdbConfiguration(jsonDictionary: configuration as! [NSObject: AnyObject]) {
               AppConfiguration.sharedInstance.setTmdbConfiguration(tmdbConfiguration)
               observer.onNext(tmdbConfiguration)
            }
            
         }.addDisposableTo(self.disposeBag)
         
         return AnonymousDisposable {}
   
      }

   }

}