import UIKit

class SettingCellTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageSetting: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func binding(dataFirst: FirstSectionSettingEnum) {
        self.imageSetting.image = .init(named: dataFirst.imageString)
        self.title.text = dataFirst.title
    }
    
    func binding(dataSecond: SecondSectionSettingEnum) {
        self.imageSetting.image = .init(named: dataSecond.imageString)
        self.title.text = dataSecond.title
    }
}
