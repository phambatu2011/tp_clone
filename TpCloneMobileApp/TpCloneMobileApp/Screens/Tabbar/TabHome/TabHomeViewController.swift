import UIKit

class TabHomeViewController: UIViewController {
    
    @IBOutlet weak var vayView: UIView!
    @IBOutlet weak var saveMoneyView: UIView!
    @IBOutlet weak var applePayView: UIView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet var dotCollectionOutlet: [SelectView]!
    @IBOutlet weak var accountCollectionView: UICollectionView!
    @IBOutlet weak var advertisementCollectionView: UICollectionView!
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightTopImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageHeader: UIImageView!
    
    private var originalHeight: CGFloat = 300
    private let advertisementImage: [String] = ["IMG_7830", "IMG_7831", "IMG_7832", "IMG_7833"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.isHidden = true
        
        accountCollectionView.reloadData()
    }
    
    private func setup() {
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        
        advertisementCollectionView.register(.init(nibName: "AdvertisementCollectionViewCell", bundle: nil),
                                             forCellWithReuseIdentifier: "AdvertisementCollectionViewCell")
        accountCollectionView.register(.init(nibName: "AccountCollectionViewCell", bundle: nil),
                                       forCellWithReuseIdentifier: "AccountCollectionViewCell")
        accountCollectionView.register(.init(nibName: "GoodNumberCollectionViewCell", bundle: nil),
                                       forCellWithReuseIdentifier: "GoodNumberCollectionViewCell")
        advertisementCollectionView.dataSource = self
        advertisementCollectionView.delegate = self
        accountCollectionView.dataSource = self
        accountCollectionView.delegate = self
        dotCollectionOutlet[0].isSelected = true
        if let acount = AppData.account {
            userNameLabel.text = acount.userName
        }
        vayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleVay)))
        applePayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleapplePay)))
        saveMoneyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSavemn)))
    }
    
    @objc func handleSavemn() {
        let vc = PastInTransactionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleapplePay() {
        let vc = PastOutTransactionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleVay() {
        let vc = MoneyInViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TabHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == accountCollectionView {
            return 2
        } else {
            return 4
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == accountCollectionView {
            if indexPath.row == 0 {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCollectionViewCell",
                                                                    for: indexPath) as? AccountCollectionViewCell else {return .init()}
                cell.layer.cornerRadius = 12
                cell.layer.masksToBounds = true
                cell.binding(data: AppData.account)
                cell.enquiryCompletion = {[weak self] in
                    guard let self = self else {return}
                    let vc = SearchTransactionViewController.init()
                    vc.navigationController?.setNavigationBarHidden(false, animated: true)
                    vc.navigationController?.navigationBar.isHidden = false
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                
                cell.transferCompletion = {[weak self] in
                    guard let self = self else {return}
                    let vc = TransferMoneyViewController.init()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
                return cell
            } else {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodNumberCollectionViewCell",
                                                                    for: indexPath) as? GoodNumberCollectionViewCell else {return .init()}
                cell.layer.cornerRadius = 12
                cell.layer.masksToBounds = true
                return cell
            }
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertisementCollectionViewCell",
                                                                for: indexPath) as? AdvertisementCollectionViewCell else {return .init()}
            cell.layer.cornerRadius = 12
            cell.layer.masksToBounds = true
            cell.binding(image: self.advertisementImage[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == accountCollectionView {
            return .init(width: UIScreen.main.bounds.width - 60, height: 150)
        } else {
            return .init(width: UIScreen.main.bounds.width - 32, height: 170)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == accountCollectionView {
            return 14
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == accountCollectionView {
            return 14
        } else {
            return 0
        }
    }
}

extension TabHomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let offset = scrollView.contentOffset.y
            let defaultTop = CGFloat(0)
            var currentTop = defaultTop
            
            if scrollView == self.scrollView {
                if offset < 0 {
                    currentTop = offset
                    heightTopImageConstraint.constant = originalHeight - (offset*1.2)
                } else {
                    heightTopImageConstraint.constant = originalHeight
                }
                imageTopConstraint.constant = currentTop
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == advertisementCollectionView {
            let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
            if index <= 4 {
                for (i, element) in dotCollectionOutlet.enumerated() {
                    if i == index {
                        element.isSelected = true
                    } else {
                        element.isSelected = false
                    }
                }
            }
        }
    }
}

class SelectView: UIView {
    @IBInspectable var isSelected: Bool = false {
        didSet {
            if isSelected {
                self.layer.borderColor = UIColor(rgb: 0xffD1D0D8).cgColor
                self.borderWidth = 0
                self.layer.cornerRadius = 5
                self.layer.masksToBounds = true
                self.backgroundColor = UIColor(rgb: 0xffD1D0D8)
            } else {
                self.layer.borderColor = UIColor(rgb: 0xffD1D0D8).cgColor
                self.borderWidth = 1
                self.layer.cornerRadius = 5
                self.backgroundColor = .white
                self.layer.masksToBounds = true
            }
        }
    }
}
