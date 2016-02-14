//
//  MainMoviesListCell.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

class MainMoviesListCell: UICollectionViewCell {

   private let disposeBag = DisposeBag()
   
   static var identifier: String { return String(self) }
   
   @IBOutlet weak private var posterImage: UIImageView!
   @IBOutlet weak private var titleLabel: UILabel!
   @IBOutlet weak private var releaseDateLabel: UILabel!
 
   func updateUI(var model: MainMoviesListViewItem) {
      titleLabel.text = model.movieTitle
      releaseDateLabel.text = model.movieReleaseDate
      model.downloadPosterImage()
         .subscribeNext { (image) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
               self.posterImage.image = image
            })
         }.addDisposableTo(disposeBag)
   }
   
}
