//
//  SecondScreenTopNewsVC.swift
//  Recent News
//
//  Created by Filip  on 13.4.22..
//

import UIKit
import SafariServices

class SecondScreenTechNewsVC: UIViewController {
    
    @IBOutlet weak var imageSecondScreenTechNews: UIImageView!
    @IBOutlet weak var titleSecondScreenTechNews: UILabel!
    @IBOutlet weak var textSecondScreenTechNews: UITextView!
    @IBOutlet weak var buttonLink: UIButton!
    @IBOutlet weak var titleAuthorNameSecondScreen: UILabel!
    @IBOutlet weak var titleSourceNameSecondScreen: UILabel!
    
    var titleSecondScreenTN = ""
    var textSecondScreenTN = ""
    var imageForSecondScreen = UIImage()
    var getLink = ""
    var authorNameSecondScreen = ""
    var sourceNameSecondScreen = ""
    static let identifierStoryboard = "SecondScreenTechNews"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleSecondScreenTechNews.text = titleSecondScreenTN
        textSecondScreenTechNews.text = textSecondScreenTN
        imageSecondScreenTechNews.image = imageForSecondScreen
        titleAuthorNameSecondScreen.text = authorNameSecondScreen
        titleSourceNameSecondScreen.text = sourceNameSecondScreen
    }
    func goToLink() {
        
        if let linkUrl = URL(string: "\(getLink)") {
            let safariVC = SFSafariViewController(url: linkUrl)
            
            present(safariVC, animated: true, completion: nil)
        }
    }
    @IBAction func buttonLinkPressed(_ sender: Any) {
        goToLink()
    }
}
