//
//  AppDelegate.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

   func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
      self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
      if let window = window {
         window.rootViewController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
         ConfigurationsWireframe.presentConfigurationsModule(window)
         window.makeKeyAndVisible()
      }
      return true
   }

}

