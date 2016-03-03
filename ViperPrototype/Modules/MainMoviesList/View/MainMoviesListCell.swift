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
   
   @IBOutlet weak private var backgroundImage: UIImageView!
   @IBOutlet weak private var titleLabel: UILabel!
   @IBOutlet weak private var releaseDateLabel: UILabel!
 
   func updateUI(model: MainMoviesListViewItem) {
      backgroundImage.image = nil
      titleLabel.text = model.movieTitle
      releaseDateLabel.text = model.movieReleaseDate
      model.backdropImage?.asDriver(onErrorJustReturn: UIImage()).driveNext({ (image) -> Void in
         self.backgroundImage.image = image
      }).addDisposableTo(disposeBag)
   }
   
}
