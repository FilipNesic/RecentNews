//
//  WorldNewsTableViewCell.swift
//  Recent News
//
//  Created by Filip  on 15.4.22..
//

import UIKit

class WorldNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleWorldNewsCell: UILabel!
    @IBOutlet weak var imageWorldNewsCell: UIImageView!
    
    static let identifier = "tableViewCell"
    
    override func prepareForReuse() {
        super .prepareForReuse()
        titleWorldNewsCell.text = nil
        imageWorldNewsCell.image = nil
    }
}
