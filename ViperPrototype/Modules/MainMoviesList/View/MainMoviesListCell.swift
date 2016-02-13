//
//  MainMoviesListCell.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

class MainMoviesListCell: UICollectionViewCell {

   static var identifier: String { return String(self) }
   
   @IBOutlet weak private var titleLabel: UILabel!
 
   func updateUI(model: MainMoviesListViewItem) {
      titleLabel.text = model.movieTitle
   }
   
}
