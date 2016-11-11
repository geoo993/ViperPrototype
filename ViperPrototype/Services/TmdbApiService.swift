//
//  TmdbApiService.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

struct TmdbApiService {
   
   fileprivate let apiKey = "dac7d87953c93d4b13c689999e59fd8e"
   fileprivate let disposeBag = DisposeBag()

   fileprivate let urlSession: URLSession

   init(urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
      self.urlSession = urlSession
   }
   
   func discoverMovies() -> Observable<AnyObject> {
      return urlSession.rx_JSON(NSURLRequest(URL: NSURL(string: "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)")!))
   }
   
   func configurations() -> Observable<AnyObject> {
      return urlSession.rx_JSON(NSURLRequest(URL: NSURL(string: "https://api.themoviedb.org/3/configuration?api_key=\(apiKey)")!))
   }
   
}
