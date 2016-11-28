import Foundation
import UIKit
import RxCocoa
import RxSwift

@IBDesignable
public class SecondViewController: UIViewController {
    
    let disposeBag = DisposeBag()
 
    public init() {
        let bundle = Bundle(for: SecondViewController.self)
        super.init(nibName: "SecondView", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet public weak var dismissButton: UIButton!
    public override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton
            .rx.tap
            .subscribe(onNext:{ [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .addDisposableTo(disposeBag)
    }
    
    
}
