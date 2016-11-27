import Foundation
import UIKit
import RxSwift
import RxCocoa

public class ProfileViewModel {
    public let name:Variable<String>
    public let email:Variable<String>
    public let avatar:Variable<UIImage?>
    
    public init(name:String, email:String, avatar:UIImage? = nil) {
        self.name = Variable(name)
        self.email = Variable(email)
        self.avatar = Variable(avatar)
    }
}

