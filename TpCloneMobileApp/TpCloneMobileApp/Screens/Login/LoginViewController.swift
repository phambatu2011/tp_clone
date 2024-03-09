import UIKit
import AVKit
import AVFoundation

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var videoView: UIView!
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    }
}

extension LoginViewController {
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
    }
    
    @objc func handleTapLogin() {
        APP_DELEGATE?.appNavigator?.switchToMain()
    }
}
