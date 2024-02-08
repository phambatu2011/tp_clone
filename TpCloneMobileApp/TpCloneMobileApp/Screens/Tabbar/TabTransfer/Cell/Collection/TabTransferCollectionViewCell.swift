import UIKit

class TabTransferCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func binding(entity: TransferEnum) {
        title.text = entity.title
        image.image = UIImage(named: entity.imageString) ?? UIImage()
    }

}
