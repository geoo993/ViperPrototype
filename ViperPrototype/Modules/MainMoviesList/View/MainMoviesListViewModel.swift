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
   
   fileprivate var movie: Movie
   
   var backdropImage: Observable<UIImage>?

   fileprivate (set) var movieTitle: String
   fileprivate (set) var movieReleaseDate: String
   fileprivate (set) var movieBackdropUrl: String

   init(movie: Movie) {
   
      self.movie = movie
      
      movieTitle = movie.title
      movieBackdropUrl = movie.backdropPath
      
      let formatter = DateFormatter()
      formatter.dateStyle = DateFormatter.Style.medium
      movieReleaseDate = formatter.string(from: movie.releaseDate as Date)
   
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
