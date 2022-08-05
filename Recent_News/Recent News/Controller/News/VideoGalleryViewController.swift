//
//  VideoGalleryViewController.swift
//  Recent News
//
//  Created by Filip  on 7.5.22..
//

import UIKit
import WebKit

class VideoGalleryViewController: UIViewController {

    @IBOutlet weak var liveScoreWebView: WKWebView!
    
    var urlForVideo = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playVideo(url: urlForVideo)
    }
    
    func playVideo (url: String) {
        
        let videoUrl = NSURL(string: url)
        let requestObj = URLRequest(url: videoUrl! as URL)
        liveScoreWebView.load(requestObj)
    }
}
