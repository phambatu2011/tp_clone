

import UIKit

class SearchTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var tagImage: UIImageView!
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
                tagLbl.text = "Chuyển Tiền Đi"
                tagImage.tintColor = UIColor(rgb: 0xffFF7F8A)
                transactionMoneyLbl.textColor = UIColor.black
                transactionMoneyLbl.text = "- \(data.money?.addComma() ?? "") VND"
            } else {
                tagLbl.text = "Nhận Tiền Đến"
                tagImage.tintColor = UIColor(rgb: 0xffA6EBC3)
                transactionMoneyLbl.textColor = UIColor(rgb: 0xFF64B084)
                transactionMoneyLbl.text = "+ \(data.money?.addComma() ?? "") VND"
            }
            contentLbl.text = data.content ?? ""
            surplusLbl.text = "SD: \(String(describing: data.balance?.addComma() ?? "")) VND"
        }
    }
}
