import UIKit

class TabTransferViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        tableView.register(.init(nibName: "TabTransferTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "TabTransferTableViewCell")
        collectionView.register(.init(nibName: "TabTransferCollectionViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "TabTransferCollectionViewCell")
        collectionView.collectionViewLayout = generateLayout()
        collectionView.isScrollEnabled = false
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 10)
        tableView.isScrollEnabled = false
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = .init(width: SCREEN_WIDTH/4 - 8, height: 80)
        return layout
    }

}

extension TabTransferViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension TabTransferViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TransferListEnum.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TabTransferTableViewCell",
                                                            for: indexPath) as? TabTransferTableViewCell else {return .init()}
        cell.binding(entity: TransferListEnum.allCases[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
