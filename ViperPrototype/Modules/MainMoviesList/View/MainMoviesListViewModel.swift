//
//  MainMoviesListViewModel.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

struct MainMoviesListViewItem {
   
   private var movie: Movie
   
   var backdropImage: Observable<UIImage>?

   private (set) var movieTitle: String
   private (set) var movieReleaseDate: String
   private (set) var movieBackdropUrl: String

   init(movie: Movie) {
   
      self.movie = movie
      
      movieTitle = movie.title
      movieBackdropUrl = movie.backdropPath
      
      let formatter = NSDateFormatter()
      formatter.dateStyle = NSDateFormatterStyle.MediumStyle
      movieReleaseDate = formatter.stringFromDate(movie.releaseDate)
   
   }

}

struct MainMoviesListViewModel {
   
   var totalMoviesString: String { return "# available titles: \(movies.count)" }
   let movies: [MainMoviesListViewItem]
   
   init(movies: [Movie]) {
      
      var moviesItemsList = [MainMoviesListViewItem]()
      for movie in movies {
         let item = MainMoviesListViewItem(movie: movie)
         moviesItemsList.append(item)
      }
      self.movies = moviesItemsList
      
   }

}