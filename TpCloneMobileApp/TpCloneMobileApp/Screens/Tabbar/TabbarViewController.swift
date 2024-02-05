import UIKit
import ImageIO

class TabbarViewController: UITabBarController {
    
    let homeVC = TabHomeViewController()
    let transferVC = TabTransferViewController()
    let searchVC = TabSearchViewController()
    let settingVC = TabSettingViewController()
    
    let homeTab = UITabBarItem(title: "Trang chủ", image: .init(named: "tabbar_home"), selectedImage: .init(named: "tabbar_home_selected"))
    
    let transferTab = UITabBarItem(title: "Chuyển khoản", image: .init(named: "tabbar_fundtransfer"), selectedImage: .init(named: "tabbar_fundtransfer_selected"))
    
    let searchTab = UITabBarItem(title: "Tra cứu", image: .init(named: "tabbar_enquries"), selectedImage: .init(named: "tabbar_enquries_selected"))
    
    let settingTab = UITabBarItem(title: "Cài đặt", image: .init(named: "tabbar_settings"), selectedImage: .init(named: "tabbar_settings_selected"))
    
    let qrTab = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.isHidden = true
        
        initItem()
        configUI()
        initSideMenu()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 90
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APP_DELEGATE?.appNavigator?.navigation.isNavigationBarHidden = true
        APP_DELEGATE?.appNavigator?.navigation.navigationBar.isHidden = true
        APP_DELEGATE?.appNavigator?.navigation.setNavigationBarHidden(true, animated: true)
        tabBarController?.selectedIndex = 0
    }
    
    private func initSideMenu() {
        
    }
    
    private func configUI() {
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = CommonColor.mainColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.tabBarController?.tabBar.backgroundColor = .white
        self.delegate = self
        self.selectedIndex = 0
        
        if let tabBarController = APP_DELEGATE?.window?.rootViewController as? UITabBarController {
            tabBarController.tabBar.backgroundImage = UIImage()
            tabBarController.tabBar.shadowImage = UIImage()
            tabBarController.tabBar.backgroundColor = UIColor.clear
        }
        
    }
    
    
    private func initItem() {
        
        qrTab.isEnabled = false
        
        homeTab.titlePositionAdjustment = .init(horizontal: 0, vertical: -6)
        transferTab.titlePositionAdjustment = .init(horizontal: 0, vertical: -6)
        searchTab.titlePositionAdjustment = .init(horizontal: 0, vertical: -6)
        settingTab.titlePositionAdjustment = .init(horizontal: 0, vertical: -6)
        
        let homeNavigationController = UINavigationController(rootViewController: homeVC)
        let transferNavigationController = UINavigationController(rootViewController: transferVC)
        let searchNavigationController = UINavigationController(rootViewController: searchVC)
        let settingNavigationController = UINavigationController(rootViewController: settingVC)
        let qrNavigationController = UINavigationController(rootViewController: BaseViewController())
        
        homeNavigationController.tabBarItem = homeTab
        transferNavigationController.tabBarItem = transferTab
        searchNavigationController.tabBarItem = searchTab
        settingNavigationController.tabBarItem = settingTab
        qrNavigationController.tabBarItem = qrTab
        
        self.viewControllers = [
            homeNavigationController,
            transferNavigationController,
            qrNavigationController,
            searchNavigationController,
            settingNavigationController
        ]
        let imageData = try? Data(contentsOf: Bundle.main.url(forResource: "tabbar_qr", withExtension: "gif")!)
        let qrScanGif = UIImage.gifImageWithData(imageData!)
        let imageView = UIImageView(image: qrScanGif)
        self.tabBar.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [
            imageView.centerXAnchor.constraint(equalTo: self.tabBar.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 44),
            imageView.widthAnchor.constraint(equalToConstant: 44)
        ].forEach({$0.isActive = true})
    }
    
    deinit {
        
    }
    
}

extension TabbarViewController: UITabBarControllerDelegate {
    
}

extension Notification.Name {
    static let SHOW_SIDE_MENU = Notification.Name("SHOW_SIDE_MENU")
    static let SELECT_TAB_BAR = Notification.Name("SELECT_TAB_BAR")
}


import UIKit
import ImageIO
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}



extension UIImage {
    
    public class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("image doesn't exist")
            return nil
        }
        
        return UIImage.animatedImageWithSource(source)
    }
    
    public class func gifImageWithURL(_ gifUrl:String) -> UIImage? {
        guard let bundleURL: URL = URL(string: gifUrl)
        else {
            print("image named \"\(gifUrl)\" doesn't exist")
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("image named \"\(gifUrl)\" into NSData")
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    public class func gifImageWithName(_ name: String) -> UIImage? {
        guard let bundleURL = Bundle.main
            .url(forResource: name, withExtension: "gif") else {
            print("SwiftGif: This image named \"\(name)\" does not exist")
            return nil
        }
        guard let imageData = try? Data(contentsOf: bundleURL) else {
            print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
            return nil
        }
        
        return gifImageWithData(imageData)
    }
    
    class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
        var delay = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(
            CFDictionaryGetValue(cfProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
            to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        delay = delayObject as! Double
        
        if delay < 0.1 {
            delay = 0.1
        }
        
        return delay
    }
    
    class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        if a < b {
            let c = a
            a = b
            b = c
        }
        
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b!
            } else {
                a = b
                b = rest
            }
        }
    }
    
    class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var delays = [Int]()
        
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }
            
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
                                                            source: source)
            delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
        }
        
        let duration: Int = {
            var sum = 0
            
            for val: Int in delays {
                sum += val
            }
            
            return sum
        }()
        
        let gcd = gcdForArray(delays)
        var frames = [UIImage]()
        
        var frame: UIImage
        var frameCount: Int
        for i in 0..<count {
            frame = UIImage(cgImage: images[Int(i)])
            frameCount = Int(delays[Int(i)] / gcd)
            
            for _ in 0..<frameCount {
                frames.append(frame)
            }
        }
        
        let animation = UIImage.animatedImage(with: frames,
                                              duration: Double(duration) / 1000.0)
        
        return animation
    }
}
