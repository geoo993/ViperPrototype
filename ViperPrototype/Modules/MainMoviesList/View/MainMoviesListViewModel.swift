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
   private var backdropImage: UIImage?
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
   
      return Observable.create { observer in

         var task: NSURLSessionDownloadTask?
         
         if let posterImage = self.posterImage {
            observer.onNext(posterImage)
         } else {
            
            task = self.downloadImage(self.movie.posterPath) { (error, image) -> Void in
               
               if error != nil {
                  observer.onError(error!)
               } else {
                  self.posterImage = image
                  if let aImage = image {
                     observer.onNext(aImage)
                  }
               }
               
            }
            
         }
         
         return AnonymousDisposable {
            task?.cancel()
         }

         
      }
      
   }

   mutating func downloadBackdropImage() -> Observable<UIImage> {
      
      return Observable.create { observer in
         
         var task: NSURLSessionDownloadTask?
         
         if let backdropImage = self.backdropImage {
            observer.onNext(backdropImage)
         } else {
            
            task = self.downloadImage(self.movie.backdropPath) { (error, image) -> Void in
               
               if error != nil {
                  observer.onError(error!)
               } else {
                  self.backdropImage = image
                  if let aImage = image {
                     observer.onNext(aImage)
                  }
               }
               
            }
            
         }
         
         return AnonymousDisposable {
            task?.cancel()
         }
         
      }
      
   }
   
   private func downloadImage(path: String, onCompletion: (error: ErrorType?, image: UIImage?) -> Void) -> NSURLSessionDownloadTask {
   
      let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
      let task = session.downloadTaskWithRequest(NSURLRequest(URL: NSURL(string: path)!), completionHandler: { (location, _, error) -> Void in
         
         if error != nil {
            onCompletion(error: error, image: nil)
         } else {

            if let location = location,
               imageData = NSData(contentsOfFile: location.relativePath!),
               image = UIImage(data: imageData) {
                  
                  onCompletion(error: nil, image: image)
                  
            } else {
               onCompletion(error: NSError(domain: "ViperPrototype", code: 1000, userInfo: nil), image: nil)
            }
            
         }
         
      })
      task.resume()
      
      return task

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