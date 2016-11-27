import Foundation
import UIKit
import RxSwift
import RxCocoa

public typealias BaseViewController = UIViewController
public typealias SecondViewController = UIViewController

public class ProfileViewController: BaseViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    public var profileViewModel:ProfileViewModel!
    
    public init() {
        let bundle = Bundle(for: ProfileViewController.self)
        super.init(nibName: "ProfileView", bundle: bundle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        profileViewModel.avatar
            .asObservable()
            .bindTo(imageView.rx.image)
            .addDisposableTo(disposeBag)
        
        profileViewModel.email
            .asObservable()
            .map(Optional.init)
            .bindTo(emailLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        profileViewModel.name
            .asObservable()
            .map(Optional.init)
            .bindTo(nameLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
    
}
