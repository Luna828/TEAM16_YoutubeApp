import UIKit
import WebKit

class DetailPageViewController: UIViewController {
    var webView = WKWebView()
    var videoId: String?

    init(videoId: String?) {
        super.init(nibName: nil, bundle: nil)
        self.videoId = videoId
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
    }

    override func viewDidLoad() {
        loadView()

        guard let VIDEO_ID = videoId else {
            print("없는 URL 입니다")
            return
        }
        // loadUrl("https://m.youtube.com/watch?v=DFHrowAl1Hw")
        loadUrl("https://youtu.be/\(VIDEO_ID)")
    }

    func loadUrl(_ url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
