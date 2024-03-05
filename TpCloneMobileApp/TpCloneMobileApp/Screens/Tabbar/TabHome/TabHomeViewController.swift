import UIKit

class TabHomeViewController: UIViewController {
    
    @IBOutlet weak var imageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightTopImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageHeader: UIImageView!
    
    private var originalHeight: CGFloat = 230
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
    }
    
    
}

extension TabHomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        print(offset)
        let defaultTop = CGFloat(0)
        var currentTop = defaultTop
        
        if scrollView == self.scrollView {
            if offset < 0 {
                currentTop = offset
                heightTopImageConstraint.constant = originalHeight - (offset*1.2)
            } else {
                heightTopImageConstraint.constant = originalHeight
            }
            imageTopConstraint.constant = currentTop
        }
    }
}
