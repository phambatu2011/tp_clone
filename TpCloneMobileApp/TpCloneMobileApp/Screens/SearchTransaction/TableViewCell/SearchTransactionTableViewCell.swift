

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
    
}
