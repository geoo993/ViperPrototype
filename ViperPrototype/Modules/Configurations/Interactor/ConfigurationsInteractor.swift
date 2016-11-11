//
//  ConfigurationsInteractor.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift

struct ConfigurationsInteractor {
   
   fileprivate let disposeBag = DisposeBag()
   fileprivate let dataManager: TmdbApiDataManager
   
   init(dataManager: TmdbApiDataManager) {
      self.dataManager = dataManager
   }
   
   func getConfigurations() -> Observable<Bool> {
      
      return Observable.create { observer in
      
        self.dataManager.configurations().subscribe(onNext: { (configuration) -> Void in
            observer.onNext(configuration.imagesBaseUrl != "")
         }).addDisposableTo(self.disposeBag)

        return Disposables.create { }
         
      }
      
   }
   
}
