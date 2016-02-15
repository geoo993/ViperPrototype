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
   private var appConfiguration: AppConfiguration
   private let disposeBag = DisposeBag()

   init(apiService: TmdbApiService, appConfiguration: AppConfiguration = AppConfiguration.sharedInstance) {
      self.apiService = apiService
      self.appConfiguration = appConfiguration
   }
   
   func discoverMovies() -> Observable<[Movie]> {

      return Observable.create { observer in
      
         let discover = self.apiService.discoverMovies()
         
         discover.subscribeNext { (dictionary) -> Void in
            
            if let jsonMovies = dictionary as? [NSObject: AnyObject] {
               var movies = [Movie]()
               for jsonMovie in jsonMovies["results"] as! [[NSObject: AnyObject]] {
                  
                  var movie = Movie(jsonDictionary: jsonMovie)

                  movie?.updatePosterPath(self.appConfiguration.posterBasePath)
                  movie?.updateBackdropPath(self.appConfiguration.backdropBasePath)
                  
                  if let movie = movie {
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