

import UIKit

class TransferMoneyViewController: BaseViewController {

    @IBOutlet weak var accoutNumberLbl: UILabel!
    @IBOutlet weak var surplusNumberLbl: UILabel!
    @IBOutlet weak var typeTransactionStackView: UIStackView!
    @IBOutlet weak var leadingPurpleView: NSLayoutConstraint!
    @IBOutlet weak var chooseBankView: UIView!
    @IBOutlet weak var bankNumberTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    @IBOutlet weak var transactionContentTextField: UITextField!
    @IBOutlet weak var containContinueBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(title: "Chuyển Tiền Liên Ngân Hàng")
        chooseBankView.isHidden = true
        typeTransactionStackView.arrangedSubviews.forEach { sub in
            sub.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapChooseTransactionType(_:))))
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        containContinueBtnView.dropShadow(color: .black,opacity: 0.05, offSet: .init(width: -1, height: -10), radius: 3, scale: true)
    }
    
    @IBAction func continueBtn(_ sender: Any) {
        
    }
    
    
    @objc func didTapChooseTransactionType(_ gesture: UITapGestureRecognizer) {
        guard let targetView = gesture.view else {return}
        
        for subview in typeTransactionStackView.arrangedSubviews {
            if targetView == subview {
                subview.subviews.forEach { sub in
                    if let sub = sub as? UILabel {
                        sub.textColor = .white
                    }
                }
            } else {
                subview.subviews.forEach { sub in
                    if let sub = sub as? UILabel {
                        sub.textColor = .gray
                    }
                }
            }
        }
        
        let index = typeTransactionStackView.arrangedSubviews.firstIndex(of: targetView)
        if index == 1 {
            chooseBankView.isHidden = false
        } else {
            chooseBankView.isHidden = true
        }
        leadingPurpleView.constant = 2 + (CGFloat((index ?? 0)) * typeTransactionStackView.frame.width/3)
        
        UIView.animate(withDuration: 0.25, delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut) { [weak self] in
            guard let self = self else {return}
            self.view.layoutIfNeeded()
        }
    }

}

extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 1, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
