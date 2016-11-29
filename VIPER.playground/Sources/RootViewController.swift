import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxSegue

@IBDesignable
public class RootViewController: UIViewController {
    
    @IBOutlet public weak var presentButton : UIButton!
    
    let disposeBag = DisposeBag()
    let store : ProvidesRouteDispatch
    
    public init(store: AppStore) {
        self.store = store
        let bundle = Bundle(for: RootViewController.self)
        super.init(nibName: "RootView", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        presentButton.rx.tap
        .subscribe(onNext: {
            //print(#file, #line, "navigationController", self.navigationController as Any)
            self.store.dispatchRoute("segueScreen")
        })
        .addDisposableTo(disposeBag)
    }
}
