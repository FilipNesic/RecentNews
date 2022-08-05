//
//  HealthTableViewCell.swift
//  Recent News
//
//  Created by Filip  on 8.5.22..
//

import UIKit

class HealthTableViewCell: UITableViewCell {

    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var titleHealth: UILabel!
    @IBOutlet weak var sourceTitle: UILabel!
    @IBOutlet weak var gradientImageBlack: UIImageView!
    
    static var identifier = "HealthTableViewCell"

    override func prepareForReuse() {
        super.prepareForReuse()
        healthImage.image = nil
        titleHealth.text = nil
    }
}
