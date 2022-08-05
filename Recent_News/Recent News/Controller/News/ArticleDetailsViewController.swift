//
//  ArticleDetailsViewController.swift
//  Recent News
//
//  Created by Filip  on 1.6.22..
//

import UIKit
import SafariServices

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var authorTitle: UILabel!
    @IBOutlet weak var sourceTitle: UILabel!
    @IBOutlet weak var articleText: UITextView!
    @IBOutlet weak var fullArticle: UIButton!
    
    static var identifier = "ArticleDetailsViewController"
    
    var imageForArticle = UIImage()
    var titleForArticle = ""
    var titleForAuthor = ""
    var titleForSource = ""
    var textForArticle = ""
    var linkFullArticle = UIButton()
    var getLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleImage.image = imageForArticle
        newsTitle.text = titleForArticle
        authorTitle.text = titleForAuthor
        sourceTitle.text = titleForSource
        articleText.text = textForArticle
        fullArticle = linkFullArticle
    }
    
    func goToLink() {
        
        if let linkUrl = URL(string: "\(getLink)") {
            let safariVC = SFSafariViewController(url: linkUrl)
            
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func fullArticleButtonPressed(_ sender: Any) {
        
        goToLink()
    }
    
}


