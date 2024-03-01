import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("The code runs through here!")
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupNavigationBar(title: String) {
        let image = UIImage(named: "home-top-bg")
        self.navigationController?.navigationBar.setBackgroundImage(image,
                                                                    for: .default)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundImage = image
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            
        } else {
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        navigationController?.navigationBar.subviews.forEach({$0.removeFromSuperview()})
        self.navigationItem.setHidesBackButton(true, animated: true)
                
        let back = UIImageView(image: .init(named: "ic_24px_back_Normal"))
        back.isUserInteractionEnabled = true
        back.translatesAutoresizingMaskIntoConstraints = false
        back.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBack)))
        navigationController?.navigationBar.addSubview(back)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.addSubview(titleLabel)
        
        if let navigationBar = navigationController?.navigationBar {
            [
                back.widthAnchor.constraint(equalToConstant: 30),
                back.heightAnchor.constraint(equalToConstant: 30),
                back.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
                back.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -8),
                titleLabel.centerYAnchor.constraint(equalTo: back.centerYAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor)
            ].forEach({$0.isActive = true})
        }
        
        let backButtonItem = UIBarButtonItem(customView: back)
        
        navigationController?.navigationItem.leftBarButtonItem = backButtonItem
        
    }
    
    func setupNavigationBarSwitch(title: String) {
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = .init(rgb: 0xffDC8630)
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            
        } else {
            self.navigationController?.navigationBar.backgroundColor = .init(rgb: 0xffDC8630)
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        navigationController?.navigationBar.subviews.forEach({$0.removeFromSuperview()})
        self.navigationItem.setHidesBackButton(true, animated: true)
                
        let back = UIImageView(image: .init(named: "ic_24px_back_Normal"))
        back.isUserInteractionEnabled = true
        back.translatesAutoresizingMaskIntoConstraints = false
        back.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSwitch)))
        navigationController?.navigationBar.addSubview(back)
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationController?.navigationBar.addSubview(titleLabel)
        
        if let navigationBar = navigationController?.navigationBar {
            [
                back.widthAnchor.constraint(equalToConstant: 30),
                back.heightAnchor.constraint(equalToConstant: 30),
                back.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 16),
                back.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -8),
                titleLabel.centerYAnchor.constraint(equalTo: back.centerYAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor)
            ].forEach({$0.isActive = true})
        }
        
        let backButtonItem = UIBarButtonItem(customView: back)
        
        navigationController?.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    deinit {
        print("\(String(describing: self.nibName.unsafelyUnwrapped)) deinit")
    }
}

extension BaseViewController {
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleSwitch() {
        APP_DELEGATE?.appNavigator?.backToTabbar()
    }
}
