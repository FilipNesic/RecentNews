//
//  ForecastTableViewCell.swift
//  Recent News
//
//  Created by Filip  on 5.6.22..
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var temperatureTitle: UILabel!
    @IBOutlet weak var conditionsImage: UIImageView!
    @IBOutlet weak var backgroundGrayView: UIView!
    
    static var identifier = "ForecastTableViewCell"
    
}
