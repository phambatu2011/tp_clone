import UIKit

class SettingInforTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func binding(data: AccountModel?) {
        if let acount = data {
            nameLabel.text = acount.userName
        }
    }
    
}
