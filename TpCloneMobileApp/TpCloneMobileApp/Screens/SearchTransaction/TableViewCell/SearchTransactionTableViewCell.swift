

import UIKit

class SearchTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var transactionMoneyLbl: UILabel!
    @IBOutlet weak var surplusLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func binding(data: TransferModel?) {
        if let data = data {
            TitleLbl.text = data.content
            if data.isReceive == false {
                transactionMoneyLbl.textColor = UIColor.black
                transactionMoneyLbl.text = "- \(data.money?.addComma() ?? "") VND"
            } else {
                transactionMoneyLbl.textColor = UIColor(rgb: 0xFF64B084)
                transactionMoneyLbl.text = "+ \(data.money?.addComma() ?? "") VND"
            }
        }
    }
}
