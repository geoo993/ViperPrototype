//
//  MainMoviesListView.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainMoviesListView: UIViewController {

   @IBOutlet weak private var detailButton: UIButton!
   @IBOutlet weak private var totalMoviesLabel: UILabel!
   
   private let disposeBag = DisposeBag()
   
   //TODO: inject this dependency
   var presenter: MainMoviesListPresenter?
   
   //MARK: UIViewController
   
   override func viewDidLoad() {
      super.viewDidLoad()
      navigationController?.navigationBarHidden = true

      presenter?.handleDetailButtonTap(detailButton.rx_tap)

      presenter?.getAllMovies().subscribeNext({ (movies) -> Void in
         self.showAllMovies(movies)
      }).addDisposableTo(disposeBag)
   }
   
   //MARK: Private
   
   private func showAllMovies(movies: [Movie]) {
      totalMoviesLabel.text = "# available titles: \(movies.count)"
   }

}
