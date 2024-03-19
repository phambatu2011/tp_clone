

import UIKit

class SearchTransactionViewController: BaseViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let data = AppData.listTransaction
    var section: [[TransferModel]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        tableView.delegate = self
        tableView.dataSource = self
        
        setupNavigationBar(title: AppData.account?.numberAccount ?? "", isBack: true)
        
        tableView.register(UINib(nibName: "SearchTransactionTableViewCell",
                                 bundle: nil), forCellReuseIdentifier: "cell")
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func setup() {
        guard let data = data?.sorted(by: {$0.date! > $1.date!}) else {
            numberLabel.text = "0 giao dịch"
            return
        }
        numberLabel.text = "\(data.count) giao dịch"
        for element in data {
            if let index = section.firstIndex(where: { arr in
                return arr.contains { model in
                    return element.date?.format(partern: "dd/MM/yyyy") == model.date?.format(partern: "dd/MM/yyyy")
                }
            }) {
                section[index].append(element)
            } else {
                section.append([element])
            }
        }
    }

}

extension SearchTransactionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SearchTransactionTableViewCell else {return UITableViewCell()}
        cell.binding(data: section[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 247, green: 241, blue: 251)
        
        let label = UILabel()
        headerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15)
        ])
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor(red: 124, green: 49, blue: 194)
        
        guard let trans = self.section[section].first else {return .init()}
        let weekday = Calendar.current.component(.weekday, from: trans.date ?? .init())
        // Sử dụng weekday để biến đổi thành tên thứ
        let weekdayString: String
        switch weekday {
        case 1:
            weekdayString = "Chủ Nhật"
        case 2:
            weekdayString = "Thứ Hai"
        case 3:
            weekdayString = "Thứ Ba"
        case 4:
            weekdayString = "Thứ Tư"
        case 5:
            weekdayString = "Thứ Năm"
        case 6:
            weekdayString = "Thứ Sáu"
        case 7:
            weekdayString = "Thứ Bảy"
        default:
            weekdayString = "Không xác định"
        }
        label.text = "\(String(describing: trans.date?.format(partern: "dd/MM/yyyy") ?? "")) - \(weekdayString)"
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        35
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TransactionDetailsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
