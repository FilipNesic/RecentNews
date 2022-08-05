//
//  SportNewsCollectionViewCellHorizontal.swift
//  Recent News
//
//  Created by Filip  on 6.5.22..
//

import UIKit

class SportNewsCollectionViewCellHorizontal: UICollectionViewCell {
    
    @IBOutlet weak var imageSportNewsCollectionCell: UIImageView!
    @IBOutlet weak var titleSportNewsCollectionCell: UILabel!
    @IBOutlet weak var gradientImageBlack: UIImageView!
    
    static var identifier = "SportNewsCollectionViewCellHorizontal"
    
    override func prepareForReuse() {
        super .prepareForReuse()
        imageSportNewsCollectionCell.image = nil
        titleSportNewsCollectionCell.text = nil
    }
}
