import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxSegue

@IBDesignable
public class SegueViewController: UIViewController {
    public let disposeBag : DisposeBag = DisposeBag()
    @IBOutlet public var pushButton: UIButton!
    @IBOutlet public var presentButton: UIButton!
    @IBOutlet public weak var dismissButton: UIButton!
    
    public init() {
        let bundle = Bundle(for: SegueViewController.self)
        super.init(nibName: "SegueView", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public var voidSegue: AnyObserver<Void> {
        return ModalSegue(fromViewController: self,
                          toViewControllerFactory: { (sender, context) -> SecondViewController in
                return SecondViewController()
        }).asObserver()
    }
    
    public var profileSegue: AnyObserver<ProfileViewModel> {
        guard let navigationController = self.navigationController
            else {
                print(#file, #line, "🚫", "no navigation controller")
                return AnyObserver<ProfileViewModel>{ _ in return }
            }
        
        return NavigationSegue(fromViewController: navigationController,
            toViewControllerFactory: { (sender, context) -> ProfileViewController in
                let profileViewController = ProfileViewController()
                profileViewController.profileViewModel = context
                return profileViewController
            }).asObserver()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        presentButton.rx.tap
            .bindTo(voidSegue)
            .addDisposableTo(disposeBag)

        pushButton.rx.tap
            .map {
                return ProfileViewModel(name: "John Doe",
                                        email: "JohnDoe@example.com",
                                        avatar: UIImage(named: "avatar"))
            }
            .bindTo(profileSegue)
            .addDisposableTo(disposeBag)
        
        dismissButton.rx.tap
            .subscribe (onNext: { [weak self] in
                self?.dismiss(animated: true, completion: nil)
            })
            .addDisposableTo(disposeBag)
    }
    
}
