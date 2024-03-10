import UIKit

class AccountCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var numberAccountLabel: UILabel!
    @IBOutlet weak var qrView: UIView!
    @IBOutlet weak var transferView: UIView!
    @IBOutlet weak var enquiryView: UIView!
    
    var enquiryCompletion: (() -> Void)? = nil
    var transferCompletion: (() -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setup()
    }
    
    private func setup() {
        enquiryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleEnquiry)))
        transferView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTransfer)))
    }
    
    func binding(data: AccountModel? = nil) {
        if let account = AppData.account {
            numberAccountLabel.text = account.numberAccount
//            accountNameLbl.text = account.userName
//            accountPlaceLbl.text = account.openBranch
            moneyLabel.text = "\(account.balance?.addComma() ?? "0") VND"
        }
    }

}

extension AccountCollectionViewCell {
    @objc func handleEnquiry() {
        enquiryCompletion?()
    }
    
    @objc func handleTransfer() {
        transferCompletion?()
    }
}
