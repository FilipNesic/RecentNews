//
//  SportNewsTableViewCell.swift
//  Recent News
//
//  Created by Filip  on 6.5.22..
//

import UIKit

class SportNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var sportNewsImageCell: UIImageView!
    @IBOutlet weak var sportNewsTitleCell: UILabel!

    static var identifier = "SportNewsTableViewCell"
    
    override func prepareForReuse() {
        super .prepareForReuse()
        sportNewsImageCell.image = nil
        sportNewsTitleCell.text = nil
    }
}
