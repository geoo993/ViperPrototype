//
//  TmdbApiService.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct TmdbApiService {
   
   private let apiKey = "dac7d87953c93d4b13c689999e59fd8e"
   private let disposeBag = DisposeBag()
   
   func discoverMovies() -> Observable<AnyObject> {
      let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
      return urlSession.rx_JSON(NSURLRequest(URL: NSURL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)")!))
   }
   
   func downloadImage(name: String) {
      //http://image.tmdb.org/t/p/w780/fnY5UDKdopZnGvzgbJIz9fAFImx.jpg
   }
   
   func configurations() -> Observable<AnyObject> {
      let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
      return urlSession.rx_JSON(NSURLRequest(URL: NSURL(string: "https://api.themoviedb.org/3/configuration?api_key=\(apiKey)")!))
   }
   
}