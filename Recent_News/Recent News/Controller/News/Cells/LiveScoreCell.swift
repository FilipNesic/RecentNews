//
//  SportNewsGalleryCell.swift
//  Recent News
//
//  Created by Filip  on 7.5.22..
//

import UIKit


class LiveScoreCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailForVideo: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!

    static var identifier = "LiveScoreCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailForVideo.image = nil
        videoTitle.text = nil
    }
}



