//
//  SportNewsCollectionViewCellVertical.swift
//  Recent News
//
//  Created by Filip  on 7.5.22..
//

import UIKit

class SportNewsCollectionViewCellVertical: UICollectionViewCell {
    
    @IBOutlet weak var imageVerticalCollection: UIImageView!
    @IBOutlet weak var titleNewsVerticalCollection: UILabel!

    static var identifier = "SportNewsCollectionViewCellVertical"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageVerticalCollection.image = nil
        titleNewsVerticalCollection.text = nil
    }
}
