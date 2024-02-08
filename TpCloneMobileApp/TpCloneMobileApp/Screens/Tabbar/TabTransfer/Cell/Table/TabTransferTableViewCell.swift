import UIKit

class TabTransferTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageTransfer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func binding(entity: TransferListEnum) {
        imageTransfer.image = UIImage(named: entity.imageString) ?? UIImage()
        title.text = entity.title
    }
    
}
