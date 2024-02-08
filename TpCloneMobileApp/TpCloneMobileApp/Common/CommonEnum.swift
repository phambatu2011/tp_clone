import Foundation

enum TransferEnum: Int, CaseIterable {
    case tpBank, otherBank, atm, list, abroad, stock
    
    var title: String {
        switch self {
        case .tpBank:
            return "Trong TPBank"
        case .otherBank:
            return "Liên Ngân Hàng"
        case .atm:
            return "Qua Thẻ ATM"
        case .list:
            return "CT Theo\nDanh Sách"
        case .abroad:
            return "Chuyển Tiền Du Học"
        case .stock:
            return "Chứng khoán"
        }
    }
    
    var imageString: String {
        switch self {
        case .tpBank:
            return "logo-tpbank-new"
        case .otherBank:
            return "Enquiries_Account"
        case .atm:
            return "atm-icon-transfer-2"
        case .list:
            return "FundTransfer_List_1"
        case .abroad:
            return "FundTransfer_Abroad_1"
        case .stock:
            return "stock-icon-transfer-2"
        }
    }
}

enum TransferListEnum: Int, CaseIterable {
    case formSaved, commandByCalendar, phonebook
    
    var title: String {
        switch self {
        case .formSaved:
            return "Mẫu chuyển tiền đã lưu"
        case .commandByCalendar:
            return "Lệnh Chuyển Tiền Theo Lịch"
        case .phonebook:
            return "Danh bạ"
        }
    }
    
    var imageString: String {
        switch self {
        case .formSaved:
            return "save-transfer"
        case .commandByCalendar:
            return "atm-icon-transfer-1"
        case .phonebook:
            return "contact-transfer"
        }
    }
}
