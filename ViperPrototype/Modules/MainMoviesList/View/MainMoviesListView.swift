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

class MainMoviesListCollectionFLowLayout: UICollectionViewFlowLayout {

   override var itemSize: CGSize {
      get { return CGSize(width: collectionView!.contentSize.width, height: 200) }
      set { }
   }
   
   override var minimumLineSpacing: CGFloat {
      get { return 0 }
      set { }
   }
   
}

class MainMoviesListView: UIViewController {

   @IBOutlet weak fileprivate var totalMoviesLabel: UILabel!
   @IBOutlet weak fileprivate var collectionView: UICollectionView!
   
   fileprivate let disposeBag = DisposeBag()
   
   var presenter: MainMoviesListPresenter?
   
   //MARK: UIViewController
   
   override func viewDidLoad() {
      super.viewDidLoad()

      collectionView.setCollectionViewLayout(MainMoviesListCollectionFLowLayout(), animated: false)
      
//    let a = collectionView.rx.items(cellIdentifier: MainMoviesListCell.identifier, cellType: MainMoviesListCell.self)
    
    //{ (_:Int, model: MainMoviesListViewModel, cell: MainMoviesListCell) in
//        model.backdropImage = ImagesService.sharedInstance.downloadImage(model.movieBackdropUrl)
//        cell.updateUI(model)
//    }
    
    // FIXME: ❗️SWIFT-3 migration break
    if let presenter = presenter {
         let moviesObserver = presenter.gotAllMovies().shareReplay(1)
//         moviesObserver
//            .map({ $0.totalMoviesString })
//            .observeOn(MainScheduler.instance)
//            .bindTo(totalMoviesLabel.rx.text)
//            .addDisposableTo(disposeBag)
//         moviesObserver
//            .map({ $0.movies })
//            .observeOn(MainScheduler.instance)
//            .bindTo(collectionView.rx.items(cellIdentifier: MainMoviesListCell.identifier, cellType: MainMoviesListCell.self) { (_:Int, model: MainMoviesListViewModel, cell: MainMoviesListCell) in
//               model.backdropImage = ImagesService.sharedInstance.downloadImage(model.movieBackdropUrl)
//               cell.updateUI(model)
//            })
//            .addDisposableTo(disposeBag)
      }
   }

   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.isNavigationBarHidden = true
   }

}
