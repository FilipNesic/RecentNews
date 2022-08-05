//
//  LiveNewsViewController.swift
//  Recent News
//
//  Created by Filip  on 30.5.22..
//

import UIKit
import AVFoundation
import AVKit
import youtube_ios_player_helper

class LiveNewsViewController: UIViewController {

    @IBOutlet weak var bacgroundBlackView: UIView!
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var playerView: YTPlayerView!
    
    static var identifier = "LiveNewsViewController"
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        bacgroundBlackView.layer.cornerRadius = 7
        playerView.load(withVideoId: "F-POY4Q0QSI")
    }
}

extension LiveNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataForCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = channelCollectionView.dequeueReusableCell(withReuseIdentifier: LiveNewsCollectionViewCell.identifier , for: indexPath) as! LiveNewsCollectionViewCell
        
        cell.imageCell.layer.cornerRadius = 7
        cell.imageCell.image = UIImage(named: "\(dataForCell[indexPath.row].Image)")
        
      return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        playerView.load(withVideoId: "\(dataForCell[indexPath.row].videoId)")
    }
    
}
