////
////  SportNewsViewController.swift
////  Recent News
////
////  Created by Filip  on 18.4.22..
////
//
//import UIKit
//
//class SportNewsViewController: UIViewController {
//    
//    @IBOutlet weak var sportNewsTableView: UITableView!
//    @IBOutlet weak var sportNewsCollectionViewHorizontal: UICollectionView!
//    @IBOutlet weak var sportNewsCollectionViewVertical: UICollectionView!
//    @IBOutlet weak var galleryButton: UIButton!
//    
//    var jsonDataTableViewSportNews: SportNewsRoot?
//    var jsonDataCollectionViewHorizontal: CollectionViewHorizontalRoot?
//    var jsonDataCollectionViewVertical: CollectionViewVerticalRoot?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        sportNewsTableView.delegate = self
//        sportNewsTableView.dataSource = self
//        sportNewsCollectionViewHorizontal.delegate = self
//        sportNewsCollectionViewHorizontal.dataSource = self
//        sportNewsCollectionViewVertical.delegate = self
//        sportNewsCollectionViewVertical.dataSource = self
//        getJsonDataForTableViewSportNews()
//        getJsonDataForHorizontalCollectionView()
//        getJsonDataForVerticalCollectionView()
//    }
//    
//    func getJsonDataForTableViewSportNews() {
//        
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=0930eedfeb574964ac27b8c59d037df7")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let getJsonDataForSportNews = try JSONDecoder().decode(SportNewsRoot.self, from: data)
//                    
//                    self.jsonDataTableViewSportNews = getJsonDataForSportNews
//                    
//                    DispatchQueue.main.async {
//                        
//                        self.sportNewsTableView.reloadData()
//                    }
//                } catch {
//                    
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
//    
//    func getJsonDataForHorizontalCollectionView() {
//        
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=0930eedfeb574964ac27b8c59d037df7")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            if let data = data {
//                
//                do {
//                    let getJsonDataForHorizontalCollection = try JSONDecoder().decode(CollectionViewHorizontalRoot.self, from: data)
//                    
//                    self.jsonDataCollectionViewHorizontal = getJsonDataForHorizontalCollection
//                    
//                    DispatchQueue.main.async {
//                        
//                        self.sportNewsCollectionViewHorizontal.reloadData()
//                    }
//                } catch {
//                    
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
//    
//    func getJsonDataForVerticalCollectionView() {
//        
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=ca&category=sports&apiKey=0930eedfeb574964ac27b8c59d037df7")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, responese, error in
//            
//            if let data = data {
//                do {
//                    let getJsonDataForVerticalCollection = try JSONDecoder().decode(CollectionViewVerticalRoot.self, from: data)
//                    
//                    self.jsonDataCollectionViewVertical = getJsonDataForVerticalCollection
//                    
//                    DispatchQueue.main.async {
//                        
//                        self.sportNewsCollectionViewVertical.reloadData()
//                    }
//                } catch {
//                    print(error)
//                }
//            }
//        }
//        task.resume()
//    }
//    
//    @IBAction func glleryBattonPressed(_ sender: UIButton) {
//        
//        let liveScoreVC = storyboard?.instantiateViewController(withIdentifier: "SportNewsGalleryViewController") as! LiveScoreViewController
//        
//        navigationController?.pushViewController(liveScoreVC, animated: true)
//    }
//}
//
//extension SportNewsViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return jsonDataTableViewSportNews?.articles.count ?? 0
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let sportNewsCell = sportNewsTableView.dequeueReusableCell(withIdentifier: SportNewsTableViewCell.identifier, for: indexPath) as! SportNewsTableViewCell
//        
//        let dataForSportNewsCell = jsonDataTableViewSportNews?.articles[indexPath.row]
//        
//        sportNewsCell.sportNewsTitleCell.text = dataForSportNewsCell?.title
//        sportNewsCell.sportNewsImageCell.layer.cornerRadius = 7
//        
//        if dataForSportNewsCell?.urlToImage != nil {
//            
//            let imageUrl = URL(string: (dataForSportNewsCell?.urlToImage)!)
//            
//            DispatchQueue.global(qos: .userInitiated).async {
//                if let imageData = try? Data(contentsOf:imageUrl!) {
//                    DispatchQueue.main.async {
//                        sportNewsCell.sportNewsImageCell.image = UIImage(data: imageData)
//                    }
//                }
//            }
//        } else {
//            sportNewsCell.sportNewsImageCell.image = UIImage(named: "defaultPhoto3")
//        }
//        return sportNewsCell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        sportNewsTableView.deselectRow(at: indexPath, animated: true)
//    }
//}
//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    
//    return 60
//}
//
//extension SportNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        if collectionView == sportNewsCollectionViewHorizontal {
//            
//            return jsonDataCollectionViewHorizontal?.articles.count ?? 0
//            
//        } else {
//            
//            return jsonDataCollectionViewVertical?.articles.count ?? 0
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if collectionView == sportNewsCollectionViewHorizontal {
//            
//            let collectionHorizontalCell = sportNewsCollectionViewHorizontal.dequeueReusableCell(withReuseIdentifier: SportNewsCollectionViewCellHorizontal.identifier, for: indexPath) as! SportNewsCollectionViewCellHorizontal
//            
//            let dataForHorizontalCollectionCell = jsonDataCollectionViewHorizontal?.articles[indexPath.row]
//            
//            collectionHorizontalCell.titleSportNewsCollectionCell.text = dataForHorizontalCollectionCell?.title
//            collectionHorizontalCell.imageSportNewsCollectionCell.layer.cornerRadius = 7
//            collectionHorizontalCell.gradientImageBlack.layer.cornerRadius = 7
//            
//            if dataForHorizontalCollectionCell?.urlToImage != nil {
//                
//                if let imageUrl = URL(string: (dataForHorizontalCollectionCell?.urlToImage)!) {
//                    
//                    DispatchQueue.global(qos: .userInitiated).async {
//                        
//                        if let imageData = try? Data(contentsOf: imageUrl) {
//                            
//                            DispatchQueue.main.async {
//                                
//                                collectionHorizontalCell.imageSportNewsCollectionCell.image = UIImage(data: imageData)
//                            }
//                        }
//                    }
//                }
//            } else {
//                collectionHorizontalCell.imageSportNewsCollectionCell.image = UIImage(named: "defaultPhoto3")
//            }
//            
//            return collectionHorizontalCell
//            
//        } else {
//            
//            let collectionVerticalCell = sportNewsCollectionViewVertical.dequeueReusableCell(withReuseIdentifier: SportNewsCollectionViewCellVertical.identifier, for: indexPath) as! SportNewsCollectionViewCellVertical
//            
//            let dataForVerticalCollectionCell = jsonDataCollectionViewVertical?.articles[indexPath.row]
//            
//            collectionVerticalCell.titleNewsVerticalCollection.text = dataForVerticalCollectionCell?.title
//            collectionVerticalCell.imageVerticalCollection.layer.cornerRadius = 7
//            
//            if dataForVerticalCollectionCell?.urlToImage != nil {
//                
//                let imageUrlVertical = URL(string: (dataForVerticalCollectionCell?.urlToImage)!)
//                
//                DispatchQueue.global(qos: .userInitiated).async {
//                    
//                    if let imageDataForVertical = try? Data(contentsOf: imageUrlVertical!) {
//                        
//                        DispatchQueue.main.async {
//                            
//                            collectionVerticalCell.imageVerticalCollection.image = UIImage(data: imageDataForVertical)
//                        }
//                    }
//                }
//            } else {
//                
//                collectionVerticalCell.imageVerticalCollection.image = UIImage(named: "defaultPhoto3")
//            }
//            return collectionVerticalCell
//        }
//    }
//}
//
//
//
//
