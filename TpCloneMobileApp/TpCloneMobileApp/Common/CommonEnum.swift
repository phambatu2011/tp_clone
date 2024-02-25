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

enum TopSettingEnum: Int, CaseIterable {
    case otp = 0, changepw, changeAuth, center, invite, changeUI
    
    var title: String {
        switch self {
        case .otp:
            return "Lấy mã Smart OTP từ eToken+"
        case .changepw:
            return "Đổi mật khẩu\ntài khoản"
        case .changeAuth:
            return "Đổi phương thức\nxác thực"
        case .center:
            return "Trung tâm\ntrợ giúp"
        case .invite:
            return "Mời bạn &\nngười thân"
        case .changeUI:
            return "Thay đổi\ngiao diện"
        }
    }
    
    var imageString: String {
        switch self {
        case .otp:
            return "settings-grid-etoken"
        case .changepw:
            return "settings-grid-password"
        case .changeAuth:
            return "settings-grid-authMethod"
        case .center:
            return "settings-grid-contact"
        case .invite:
            return "settings-grid-invite"
        case .changeUI:
            return "settings-grid-ui"
        }
    }
}

enum FirstSectionSettingEnum: Int, CaseIterable {
    case open = 0, shop, shopname, conyeu, phone, favorite
    
    var title: String {
        switch self {
        case .open:
            return "Mở tài khoản số đẹp"
        case .shop:
            return "Tài khoản Kinh doanh/Shop"
        case .shopname:
            return "Mở Tài khoản Nickname/Shopname"
        case .conyeu:
            return "Tài khoản Con yêu"
        case .phone:
            return "Cài đặt nhận tiền qua số điện thoại"
        case .favorite:
            return "Cài đặt Tài khoản Ưa thích"
        }
    }
    
    var imageString: String {
        switch self {
        case .open:
            return "settings-new-digital-account"
        case .shop:
            return "setting-business-shop"
        case .shopname:
            return "settings-new-alias"
        case .conyeu:
            return "settings-share-mode-icon"
        case .phone:
            return "settings-new-phone-account"
        case .favorite:
            return "setting-favourite"
        }
    }
}

enum SecondSectionSettingEnum: Int, CaseIterable {
    case faceid = 0, auth2, facepay, hanmuc, voicepay, notification, device, language
    
    var title: String {
        switch self {
        case .faceid:
            return "Cài đặt Face ID/Touch ID"
        case .auth2:
            return "Cài đặt bảo mật 2 lớp"
        case .facepay:
            return "Đăng kí dịch vụ Facepay"
        case .hanmuc:
            return "Thay đổi hạn mức giao dịch"
        case .voicepay:
            return "Cài đặt VoicePay"
        case .notification:
            return "Cài đặt thông báo"
        case .device:
            return "Quản lý thiết bị"
        case .language:
            return "Chọn ngôn ngữ"
        }
    }
    
    var imageString: String {
        switch self {
        case .faceid:
            return "settings-new-biometric"
        case .auth2:
            return "settings-new-2fa"
        case .facepay:
            return "settings-new-facepay"
        case .hanmuc:
            return "settings-transfer-limitation"
        case .voicepay:
            return "settings-new-voice-pay"
        case .notification:
            return "settings-new-notification"
        case .device:
            return "settings-new-device"
        case .language:
            return "settings-new-language"
        }
    }
}
