//
//  TmdbApiDataManager.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

typealias MoviesResult = Observable<[Movie]>

struct TmdbApiDataManager {

   private var apiService: TmdbApiService
   private let disposeBag = DisposeBag()

   init(apiService: TmdbApiService) {
      self.apiService = apiService
   }
   
   func getAllMovies() -> MoviesResult {
      
      return Observable.create { observer in
         observer.onNext([ Movie(title: "Zoolander 2"), Movie(title: "Panda Kung Fu 3") ])
         return AnonymousDisposable {}
      }
      
   }
   
   func discoverMovies() -> MoviesResult {

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

}