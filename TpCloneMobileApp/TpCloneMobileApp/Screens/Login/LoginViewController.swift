import UIKit
import AVKit
import AVFoundation

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var passTF: UITextField!
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var createAccount: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.attributedPlaceholder = .init(string: "Tên đăng nhập",
                                              attributes: [.foregroundColor: UIColor(rgb: 0xffD1D0D8)])
        passTF.attributedPlaceholder = .init(string: "Mật khẩu",
                                              attributes: [.foregroundColor: UIColor(rgb: 0xffD1D0D8)])
//        loginTF.attributedText = .init(string: "",
//                                              attributes: [.foregroundColor: UIColor.white])
//        passTF.attributedText = .init(string: "",
//                                      attributes: [.foregroundColor: UIColor.white])
        setupControlEvent()
        playVideo()
        
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "Tet_holiday_eve", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        player.isMuted = true
        player.actionAtItemEnd = .none
        
        avpController = AVPlayerViewController()
        avpController.showsPlaybackControls = false
        avpController.player = player
        avpController.view.contentMode = .scaleToFill
        avpController.videoGravity = .resizeAspectFill
        self.addChild(avpController)
        self.view.addSubview(avpController.view)
        avpController.didMove(toParent: self)
        avpController.view.translatesAutoresizingMaskIntoConstraints = false
        [
            avpController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avpController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            avpController.view.topAnchor.constraint(equalTo: view.topAnchor),
            avpController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ].forEach({ $0.isActive = true })
        
        if let index = self.children.firstIndex(of: avpController) {
            let childView = avpController.view
            let parentView = self.view
            parentView?.insertSubview(childView!, belowSubview: parentView?.subviews[index] ?? UIView())
        }
        
        player.play()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
    }
    
    private func setupControlEvent() {
        loginButton.addTarget(self, action: #selector(handleTapLogin), for: .touchUpInside)
        createAccount.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCreateaccount)))
        contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handlet)))
    }
}

extension LoginViewController {
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
    }
    
    @objc func handleTapLogin() {
        AppData.isLogin = true
        APP_DELEGATE?.appNavigator?.switchToMain()
    }
    
    @objc func handleCreateaccount() {
        let vc = CreateAccountViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handlet() {
        self.view.endEditing(true)
    }
}
