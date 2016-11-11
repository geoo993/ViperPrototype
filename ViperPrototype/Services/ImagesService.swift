//
//  ImagesService.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 03/03/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

class ImagesService {
   
   static let sharedInstance: ImagesService = ImagesService()

   fileprivate let urlSession: URLSession
   fileprivate var imagesCache = NSCache<AnyObject, AnyObject>()
   
   fileprivate init(urlSession: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
      self.urlSession = urlSession
   }
   
   func downloadImage(_ imageUrl: String) -> Observable<UIImage> {
      
      return Observable.deferred({ () -> Observable<UIImage> in
         
         if let image = self.imagesCache.objectForKey(imageUrl) as? UIImage {
            return Observable.just(image)
         } else {

            let result: Observable<UIImage> = self.urlSession
               .rx_data(NSURLRequest(URL: NSURL(string: imageUrl)!))
               .flatMap({ (imageData) -> Observable<UIImage> in
                  guard let image = UIImage(data: imageData) else {
                     return Observable.just(UIImage())
                  }
                  
                  return Observable.just(image)
                  
               })
            
            return result.doOn(onNext: { (image) -> Void in
               self.imagesCache.setObject(image, forKey: imageUrl)
               })

         }
         
         
      })
      
   }

}
