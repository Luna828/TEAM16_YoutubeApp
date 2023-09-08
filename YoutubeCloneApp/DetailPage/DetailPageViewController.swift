import UIKit
import WebKit

class DetailPageViewController: UIViewController {
    var webView = WKWebView()
    var videoId: String? //파라미터 넘기기 (YoutubePage.swift에서 90줄에서 확인 가능

    init(videoId: String?) {
        super.init(nibName: nil, bundle: nil)
        self.videoId = videoId
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //UI
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        view = webView
    }
    
    //URL을 받고 요청하기위한 재사용 가능 코드
    func loadUrl(_ url: String) { //파라미터로 String을 넣어줌
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    //첫 화면 시작할 때 한번만 호출되는 lifecycle 친구
    override func viewDidLoad() {
        loadView()

        //videoID가 null일수도 있기때문에 옵셔널 해제를 위한 것
        guard let VIDEO_ID = videoId else {
            print("없는 URL 입니다")
            return
        }
        
        // loadUrl("https://m.youtube.com/watch?v=DFHrowAl1Hw")
        loadUrl("https://youtu.be/\(VIDEO_ID)")
    }
}
