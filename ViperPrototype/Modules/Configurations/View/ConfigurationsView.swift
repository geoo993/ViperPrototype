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

   fileprivate let disposeBag = DisposeBag()

   var presenter: ConfigurationsPresenter?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      if let presenter = presenter {
        presenter.gotConfigurations().subscribe(onNext: { (result) -> Void in
            if !result {
               self.showError()
            }
         }).addDisposableTo(disposeBag)
      }
      
   }

   fileprivate func showError() {
      let alertController = UIAlertController(title: "Configuration error", message: "Unable to retrieve configurations", preferredStyle: UIAlertControllerStyle.alert)
      alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      present(alertController, animated: true, completion: nil)
   }
}
