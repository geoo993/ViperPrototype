
import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxSegue
import FeatherweightRouter

func createRouter() -> Router<UIViewController, String> {
    return Router(navigationPresenter(title: "Segue Fun!"))
        .stack([
            Router(segueViewPresenter()).route(predicate: { $0 == "segueScreen"}),
            Router(secondViewPresenter()).route(predicate: { $0 == "secondScreen"}),
            ])
}

func appCoordinator() -> UIViewController {
    var router: Router<UIViewController, String>!
    router = createRouter()
    
    router.setRoute("secondScreen")
    
    return router.presentable
}

let vc = appCoordinator()

import PlaygroundSupport
PlaygroundPage.current.liveView = vc

var str = "Hello, playground"
