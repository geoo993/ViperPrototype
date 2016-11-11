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

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      self.window = UIWindow(frame: UIScreen.main.bounds)
      if let window = window {
         window.rootViewController = UINavigationController(navigationBarClass: nil, toolbarClass: nil)
         ConfigurationsWireframe.presentConfigurationsModule(window)
         window.makeKeyAndVisible()
      }
      return true
   }

}

