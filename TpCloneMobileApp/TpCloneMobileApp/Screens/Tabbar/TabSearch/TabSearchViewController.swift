import UIKit

class TabSearchViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(.init(nibName: "TabTransferCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "TabTransferCollectionViewCell")
        collectionView.collectionViewLayout = generateLayout()
        collectionView.isScrollEnabled = true
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: SCREEN_WIDTH/2 - 16, height: 100)
        return layout
    }
    
}

extension TabSearchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TransferEnum.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabTransferCollectionViewCell",
                                                            for: indexPath) as? TabTransferCollectionViewCell else {return .init()}
        cell.binding(entity: TransferEnum.allCases[indexPath.row])
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
    }
}
