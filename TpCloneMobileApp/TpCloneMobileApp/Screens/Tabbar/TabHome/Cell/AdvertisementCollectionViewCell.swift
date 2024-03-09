//
//  AdvertisementCollectionViewCell.swift
//  TpCloneMobileApp
//
//  Created by Phạm Bá Tú on 09/03/2024.
//

import UIKit

class AdvertisementCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var adImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func binding(image: String) {
        adImage.image = .init(named: image)
    }
}
