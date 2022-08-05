//
//  TopNewsTableViewCell.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import UIKit

class TechNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var imageTechNews: UIImageView!
    @IBOutlet weak var titleTechNews: UILabel!
    @IBOutlet weak var titleSourceName: UILabel!
    
    static let identifier = "TechNewsTableViewCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageTechNews.image = nil
        titleTechNews.text = nil
    }
}
