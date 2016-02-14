//
//  MainMoviesListPresenter.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct MainMoviesListPresenter {
   
   private let disposeBag = DisposeBag()
   private let interactor: MainMoviesListInteractor
   private let wireframe: MainMoviesListWireframe
   
   init(interactor: MainMoviesListInteractor, wireframe: MainMoviesListWireframe) {
      self.interactor = interactor
      self.wireframe = wireframe
   }
   
   //MARK: Input
   
   //MARK: Output
   
   func gotAllMovies() -> Observable<MainMoviesListViewModel> {

      return Observable.create { observer in
         
         self.interactor.getAllMovies().subscribeNext({ (movies) -> Void in
            
            let viewModel = MainMoviesListViewModel(movies: movies)
            observer.onNext(viewModel)
            
         }).addDisposableTo(self.disposeBag)
         
         return AnonymousDisposable {}
         
      }

   }
   
}
