
import UIKit
import RxSwift
import RxCocoa
import RxGesture
import RxSegue
import FeatherweightRouter

func createRouter0(store: AppStore) -> Router<UIViewController, String> {
    return Router(navigationPresenter(title: "Segue Fun!"))
        .stack([
            Router(rootViewPresenter(store: store)).route(predicate: { $0 == "rootScreen"}),
            Router(segueViewPresenter(store: store)).route(predicate: { $0 == "segueScreen"}),
            Router(secondViewPresenter(store: store)).route(predicate: { $0 == "secondScreen"}),
            ])
}

func createRouter1(store: AppStore) -> Router<UIViewController, String> {
    return Router(navigationPresenter(title: "Segue Fun!"))
        .stack([
            Router(rootViewPresenter(store: store)).route(predicate: { $0 == "rootScreen"},
                children: [
                    Router(segueViewPresenter(store: store)).route(predicate: { $0 == "segueScreen"},
                       children: [
                        Router(profileViewPresenter(store: store)).route(predicate: { $0 == "profileScreen"}),
                        Router(secondViewPresenter(store: store)).route(predicate: { $0 == "secondScreen"}),
                        ]),
                ] ),
            ])
}

func appCoordinator() -> UIViewController {
    var router: Router<UIViewController, String>!
    let store = AppStore() {
        print($0)
        router.setRoute($0)
    }
    router = createRouter1(store: store)
    
    store.setPath("rootScreen")
    
    return router.presentable   
}

let vc = appCoordinator()

import PlaygroundSupport
PlaygroundPage.current.liveView = vc

var str = "Hello, playground"
