import UIKit

class TabSettingViewController: BaseViewController {

    @IBOutlet weak var settingTableView: UITableView!
    enum SettingSection: Int, CaseIterable {
        case infor = 0, top, search, first, second, logout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    private func config() {
        registerCell(id: "LogoutTableViewCell")
        registerCell(id: "SettingSearchTableViewCell")
        registerCell(id: "SettingCellTableViewCell")
        registerCell(id: "SettingInforTableViewCell")
        registerCell(id: "TopSettingTableViewCell")
        settingTableView.dataSource = self
        settingTableView.delegate = self
    }
    
    private func registerCell(id: String) {
        settingTableView.register(.init(nibName: id,
                                        bundle: nil), forCellReuseIdentifier: id)
    }


}

extension TabSettingViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = SettingSection(rawValue: section)
        switch section {
        case .infor:
            return 1
        case .top:
            return 1
        case .search:
            return 1
        case .first:
            return FirstSectionSettingEnum.allCases.count
        case .second:
            return SecondSectionSettingEnum.allCases.count
        case .logout:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = SettingSection(rawValue: indexPath.section)
        switch section {
        case .infor:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingInforTableViewCell",
                                                           for: indexPath) as? SettingInforTableViewCell else {return .init()}
            return cell
        case .top:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingInforTableViewCell",
                                                           for: indexPath) as? SettingInforTableViewCell else {return .init()}
            return cell
        case .first:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingInforTableViewCell",
                                                           for: indexPath) as? SettingInforTableViewCell else {return .init()}
            return cell
        case .second:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingInforTableViewCell",
                                                           for: indexPath) as? SettingInforTableViewCell else {return .init()}
            return cell
        case .logout:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingInforTableViewCell",
                                                           for: indexPath) as? SettingInforTableViewCell else {return .init()}
            return cell
        default:
            return .init()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
