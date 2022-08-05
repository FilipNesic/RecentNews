//
//  BussinesNewsViewController.swift
//  Recent News
//
//  Created by Filip  on 5.5.22..
//

import UIKit

//class BusinessNewsViewController: UIViewController {
//    
//    @IBOutlet weak var businessCollectionView: UICollectionView!
//    @IBOutlet weak var businessTableView: UITableView!
//    
//    var jsonDataCollectionView: BussinesRoot?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        businessCollectionView.delegate = self
//        businessCollectionView.dataSource = self
//        getJsonDataForBusinessNews()
//    }
//    
//    func getJsonDataForBusinessNews() {
//        
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0930eedfeb574964ac27b8c59d037df7")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let data = data {
//                do {
//                    let jsonData = try JSONDecoder().decode(BussinesRoot.self, from: data)
//                    
//                    self.jsonDataCollectionView = jsonData
//                    
//                    DispatchQueue.main.async {
//                        
//                        self.businessCollectionView.reloadData()
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
//}
//
//extension BusinessNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        jsonDataCollectionView?.articles.count ?? 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let businessCollectionCell = businessCollectionView.dequeueReusableCell(withReuseIdentifier: BusinessCollectionViewCell.identifier, for: indexPath) as! BusinessCollectionViewCell
//        
//        let jsonDataForCollectionCell = jsonDataCollectionView?.articles[indexPath.row]
//        
//        businessCollectionCell.titleBusinesscollectionView.text = jsonDataForCollectionCell?.title
//        businessCollectionCell.imageBusinessCollectionView.layer.cornerRadius = 7
//        
//        if jsonDataForCollectionCell?.urlToImage != nil {
//            
//            let urlForImage = URL(string: (jsonDataForCollectionCell?.urlToImage)!)
//            
//            DispatchQueue.global(qos: .userInitiated).async {
//                
//                if let imageData = try? Data(contentsOf: urlForImage!) {
//                    
//                    DispatchQueue.main.async {
//                        
//                        businessCollectionCell.imageBusinessCollectionView.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        } else {
//            
//            businessCollectionCell.imageBusinessCollectionView.image = UIImage(named: "defaultPhoto5")
//        }
//        return businessCollectionCell
//    }
//}
//
