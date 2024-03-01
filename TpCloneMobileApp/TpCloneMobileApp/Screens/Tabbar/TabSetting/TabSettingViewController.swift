import UIKit

class TabSettingViewController: BaseViewController {
    
    @IBOutlet weak var settingTableView: UITableView!
    enum SettingSection: Int, CaseIterable {
        case infor = 0, top, search, first, second, logout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(title: "Cài đặt")
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
        settingTableView.sectionHeaderHeight = 1
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
            cell.selectionStyle = .none
            return cell
        case .top:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TopSettingTableViewCell",
                                                           for: indexPath) as? TopSettingTableViewCell else {return .init()}
            cell.selectionStyle = .none
            return cell
        case .search:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingSearchTableViewCell",
                                                           for: indexPath) as? SettingSearchTableViewCell else {return .init()}
            cell.selectionStyle = .none
            return cell
        case .first:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCellTableViewCell",
                                                           for: indexPath) as? SettingCellTableViewCell else {return .init()}
            cell.binding(dataFirst: FirstSectionSettingEnum.allCases[indexPath.row])
            cell.selectionStyle = .none
            return cell
        case .second:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCellTableViewCell",
                                                           for: indexPath) as? SettingCellTableViewCell else {return .init()}
            cell.binding(dataSecond: SecondSectionSettingEnum.allCases[indexPath.row])
            cell.selectionStyle = .none
            return cell
        case .logout:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LogoutTableViewCell",
                                                           for: indexPath) as? LogoutTableViewCell else {return .init()}
            cell.selectionStyle = .none
            return cell
        default:
            return .init()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
        view.backgroundColor = .init(rgb: 0xffF8F8FA)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = SettingSection(rawValue: indexPath.section)
        switch section {
        case .first, .second, .logout:
            return 51
        case .search:
            return 60
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 2 {
            return 0
        } else {
            return 1
        }
    }
}
