import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appNavigator: AppNavigator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFUIText-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "SFUIText-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .regular)], for: .selected)
        self.window = .init()        
        guard let window = window else {return false}
        appNavigator = .init(window: window)
        appNavigator?.start()
        
        return true
    }

}


