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

   func getAllMovies() -> Observable<[Movie]> {
      
      return Observable.create { observer in
         observer.onNext([ Movie(title: "Zoolander 2"), Movie(title: "Panda Kung Fu 3") ])
         return AnonymousDisposable {}
      }
      
   }

}