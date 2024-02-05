import Foundation

enum TransferEnum {
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
            return "CT Theo Danh Sách"
        case .abroad:
            return "Chuyển Tiền Du Học"
        case .stock:
            return "Chứng khoán"
        }
    }
}

enum TransferListEnum {
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
}
