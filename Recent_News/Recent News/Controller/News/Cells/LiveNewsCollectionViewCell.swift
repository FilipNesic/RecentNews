//
//  LiveNewsCollectionViewCell.swift
//  Recent News
//
//  Created by Filip  on 31.5.22..
//

import UIKit

class LiveNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    static var identifier = "LiveNewsCollectionViewCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageCell.image = nil
        
    }
}
