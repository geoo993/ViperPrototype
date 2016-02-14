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
   
   private var posterImage: UIImage?
   private var movie: Movie
   
   var movieTitle: String
   var movieReleaseDate: String

   init(movie: Movie) {
   
      self.movie = movie
      
      movieTitle = movie.title
      
      let formatter = NSDateFormatter()
      formatter.dateStyle = NSDateFormatterStyle.MediumStyle
      movieReleaseDate = formatter.stringFromDate(movie.releaseDate)
   
   }
   
   mutating func downloadPosterImage() -> Observable<UIImage> {
   
      if let posterImage = posterImage {
         
         return Observable.create { observer in
            observer.onNext(posterImage)
            return AnonymousDisposable {}
         }
         
      } else {
      
         return Observable.create { observer in

            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            let task = session.downloadTaskWithRequest(NSURLRequest(URL: NSURL(string: self.movie.posterPath)!), completionHandler: { (location, _, error) -> Void in
               
               if error != nil {
                  observer.onError(error!)
               } else {
                  print(location!.absoluteString)
                  if let location = location,
                     imageData = NSData(contentsOfFile: location.relativePath!),
                     image = UIImage(data: imageData) {
                        
                     self.posterImage = image
                     observer.onNext(image)
                        
                  } else {
                     observer.onError(NSError(domain: "ViperPrototype", code: 1000, userInfo: nil))
                  }
               }
               
            })
            task.resume()

            return AnonymousDisposable {}
            
         }

      }
      
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