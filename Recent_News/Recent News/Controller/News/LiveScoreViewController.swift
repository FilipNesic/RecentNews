//
//  SportNesGalleryViewController.swift
//  Recent News
//
//  Created by Filip  on 7.5.22..
//

import UIKit


class LiveScoreViewController: UIViewController {
    
    @IBOutlet weak var liveScoreCollectionView: UICollectionView!
    
    var jsonDataForGallery: GalleryRoot?
    static var identifier = "LiveScoreViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liveScoreCollectionView.dataSource = self
        liveScoreCollectionView.delegate = self
        getJsonDataForLiveScore()
    }
    
    func getJsonDataForLiveScore() {
        
        let url = URL(string: "https://www.scorebat.com/video-api/v3/feed/?token=MTg5ODhfMTY1MjAwNzU2Nl85Y2NlNDA1YjMwNTBhNDUzMjA4MWMzZjE4ZjUxNDZkMDI1NWExMGVi")!
        
        let task = URLSession.shared.dataTask(with: url) { data, resposne, error in
            
            if let data = data {
                do {
                    let jsonDataSportGallery = try JSONDecoder().decode(GalleryRoot.self, from: data)
                    
                    self.jsonDataForGallery = jsonDataSportGallery
                    
                    DispatchQueue.main.async {
                       
                        self.liveScoreCollectionView.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
}

extension LiveScoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return jsonDataForGallery?.response.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let liveScoreCell = liveScoreCollectionView.dequeueReusableCell(withReuseIdentifier: LiveScoreCell.identifier, for: indexPath) as! LiveScoreCell
        
        let dataForGallery = jsonDataForGallery?.response[indexPath.row]
        
        liveScoreCell.videoTitle.text = dataForGallery?.title
        
        if dataForGallery?.thumbnail != nil {
            
            let thumbnailUrl = URL(string: (dataForGallery?.thumbnail)!)
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                if let thumbnailData = try? Data(contentsOf: thumbnailUrl!) {
                    
                    DispatchQueue.main.async {
                        
                        liveScoreCell.thumbnailForVideo.image = UIImage(data: thumbnailData)
                    }
                }
            }
        } else {
            liveScoreCell.thumbnailForVideo.image = UIImage(named: "defaultPhoto4")
        }
        
        return liveScoreCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        guard let videoGalleryViewController = storyboard?.instantiateViewController(withIdentifier: "VideoGalleryViewController") as? VideoGalleryViewController else {
    
            return
        }
        let dataForGalleryVideo = jsonDataForGallery?.response[indexPath.row]
        
        if dataForGalleryVideo?.matchviewUrl != nil {
            
            videoGalleryViewController.urlForVideo = (dataForGalleryVideo?.matchviewUrl)!
        } else {
            
            videoGalleryViewController.urlForVideo = (dataForGalleryVideo?.competitionUrl)!
        }
        
        self.navigationController?.pushViewController(videoGalleryViewController, animated: true)
    }
}

