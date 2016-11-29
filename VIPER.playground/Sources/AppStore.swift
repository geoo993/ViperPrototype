import Foundation

public protocol ProvidesRouteDispatch {
    func dispatchRoute(_: String)
}

public class AppStore: ProvidesRouteDispatch {
    
    public var setPath: (String) -> Void!
    
    public init(setPath: @escaping (String) -> Void) {
        self.setPath = setPath
    }
    
    public func dispatchRoute(_ string: String) {
        setPath(string)
    }
}
