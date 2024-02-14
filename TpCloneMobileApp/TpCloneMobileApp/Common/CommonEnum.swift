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

enum EnquiryEnum {
    case account, save, loan, credit, transfer, information, ctCommand
    
    var title: String {
        switch self {
        case .account:
            return "Tài khoản"
        case .save:
            return "Tiết kiệm"
        case .loan:
            return "Khoản vay"
        case .credit:
            return "Thẻ tín dụng"
        case .transfer:
            return "Lệnh chuyển tiền"
        case .information:
            return "Thông tin tổng hợp"
        case .ctCommand:
            return "Lệnh CT Tách nhỏ"
        }
    }
    
    var imageString: String {
        switch self {
        case .account:
            return "Enquiries_Account"
        case .save:
            return "Enquiries_Savings"
        case .loan:
            return "Enquiries_Loans"
        case .credit:
            return "Enquiries_CreditCard"
        case .transfer:
            return "Enquiries_Transfer"
        case .information:
            return "Enquiries_Use_Infor"
        case .ctCommand:
            return "Enquiries_SplitFunds"
        }
    }
}
