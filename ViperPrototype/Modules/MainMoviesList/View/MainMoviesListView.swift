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

   @IBOutlet weak private var totalMoviesLabel: UILabel!
   @IBOutlet weak private var collectionView: UICollectionView!
   
   private let disposeBag = DisposeBag()
   
   var presenter: MainMoviesListPresenter?
   
   //MARK: UIViewController
   
   override func viewDidLoad() {
      super.viewDidLoad()

      if let presenter = presenter {
         let moviesObserver = presenter.getAllMovies()
         moviesObserver.map({ $0.totalMoviesString }).bindTo(totalMoviesLabel.rx_text).addDisposableTo(disposeBag)
         moviesObserver.map({ $0.movies }).bindTo(collectionView.rx_itemsWithCellIdentifier(MainMoviesListCell.identifier, cellType: MainMoviesListCell.self)) { (_, model, cell) in
            cell.updateUI(model)
         }.addDisposableTo(disposeBag)
      }
   }

   override func viewWillAppear(animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.navigationBarHidden = true
   }

}