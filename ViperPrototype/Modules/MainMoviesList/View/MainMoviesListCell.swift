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

   fileprivate let disposeBag = DisposeBag()
   
   static var identifier: String { return String(describing: self) }
   
   @IBOutlet weak fileprivate var backgroundImage: UIImageView!
   @IBOutlet weak fileprivate var titleLabel: UILabel!
   @IBOutlet weak fileprivate var releaseDateLabel: UILabel!
 
   func updateUI(_ model: MainMoviesListViewItem) {
      backgroundImage.image = nil
      titleLabel.text = model.movieTitle
      releaseDateLabel.text = model.movieReleaseDate
    model.backdropImage?.asDriver(onErrorJustReturn: UIImage()).drive(onNext: { (image) -> Void in
         self.backgroundImage.image = image
      }).addDisposableTo(disposeBag)
   }
   
}
