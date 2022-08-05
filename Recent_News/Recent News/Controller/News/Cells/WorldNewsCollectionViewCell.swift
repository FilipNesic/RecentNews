//
//  WorldNewsCollectionViewCell.swift
//  Recent News
//
//  Created by Filip  on 18.4.22..
//

import UIKit

class WorldNewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionCellTitle: UILabel!
    @IBOutlet weak var imageCollectionViewCell: UIImageView!
    @IBOutlet weak var gradientImageBlack: UIImageView!
    
    static var identifier = "colectionViewCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionCellTitle.text = nil
        imageCollectionViewCell.image = nil
    }
}
