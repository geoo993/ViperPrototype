//
//  ConfigurationsView.swift
//  ViperPrototype
//
//  Created by Adriano Goncalves on 13/02/2016.
//  Copyright © 2016 Adriano Goncalves. All rights reserved.
//

import UIKit
import RxSwift

class ConfigurationsView: UIViewController {

   private let disposeBag = DisposeBag()

   var presenter: ConfigurationsPresenter?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if let presenter = presenter {
         presenter.gotConfigurations().subscribeNext({ (result) -> Void in
            if !result {
               self.showError()
            }
         }).addDisposableTo(disposeBag)
      }
      
   }

   private func showError() {
      let alertController = UIAlertController(title: "Configuration error", message: "Unable to retrieve configurations", preferredStyle: UIAlertControllerStyle.Alert)
      alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
      presentViewController(alertController, animated: true, completion: nil)
   }
}
