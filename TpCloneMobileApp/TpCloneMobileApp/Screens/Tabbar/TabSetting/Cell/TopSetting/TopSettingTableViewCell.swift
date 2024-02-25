import UIKit

class TopSettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    private func setup() {
        collectionView.register(.init(nibName: "TabTransferCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TabTransferCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = generatedLayout()
        collectionView.contentInset = .init(top: 8, left: 10, bottom: 0, right: 10)
    }
    
    private func generatedLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: (SCREEN_WIDTH-60)/3, height: 80)
        return layout
    }
    
}

extension TopSettingTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopSettingEnum.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabTransferCollectionViewCell", for: indexPath) as? TabTransferCollectionViewCell else {return .init()}
        
        cell.binding(entity: TopSettingEnum.allCases[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
}
