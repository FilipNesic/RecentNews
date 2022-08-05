//
//  WorldNewsViewController.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import UIKit
import AVKit
import AVFoundation
import CachyKit

class WorldNewsViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var tableViewWorldNews: UITableView!
    @IBOutlet weak var collectionViewWorldNews: UICollectionView!
    @IBOutlet weak var liveNewsButton: UIButton!
    @IBOutlet weak var segmentTopicBar: UISegmentedControl!
    
    var jsonDataWorldNewsCollctionView: RootWorldNews?
    var jsonDataWorldNewsTableView: RootWorldNewsTableView?
    var jsonDataBusinessCollectionView: BussinesRoot?
    var jsonDataBusinessTableView: BussinesRoot?
    var jsonDataHealthColectionView: HealthRoot?
    var jsonDataHealthTableView: HealthRoot?
    var jsonDataSportCollectionView: SportNewsRoot?
    var jsonDataSportTableVIew: SportNewsRoot?
    var jsonDataTechCollectionView: Root?
    var jsonDataTechTableView: Root?
    
    let cachy = CachyLoader()

    var playerViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        liveNewsButton.setTitle("Live News", for: .normal)
        logoImage.image = UIImage(named: "transLogo")
        collectionViewWorldNews.delegate = self
        collectionViewWorldNews.dataSource = self
        tableViewWorldNews.delegate = self
        tableViewWorldNews.dataSource = self
        getJsonDataWorldNewsCollectionView()
        getJsonDataForTableViewWorldNews()
        getJsonDataForBusinessNewsCollectionView()
        getJsonDataForBusinessNewsTableView()
        getJsonDataForHealthCollectionView()
        getJsonDataForHealthNewsTableView()
        getJsonDataForSportNewsCollectionView()
        getJsonDataForSportNewsTableView()
        getJsonDataForTechNewsCollectionView()
        getJsonDataForTechNewsTableView()
        
//        CachyLoaderManager.shared.clear()
//        print("cash empty")
    }
        
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            
            collectionViewWorldNews.reloadData()
            tableViewWorldNews.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            
            collectionViewWorldNews.reloadData()
            tableViewWorldNews.reloadData()
        }
        if sender.selectedSegmentIndex == 2 {
            
            collectionViewWorldNews.reloadData()
            tableViewWorldNews.reloadData()
        }
        if sender.selectedSegmentIndex == 3 {
            
            liveNewsButton.setTitle("Live Score", for: .normal)
            collectionViewWorldNews.reloadData()
            tableViewWorldNews.reloadData()
            
        } else {
            
            liveNewsButton.setTitle("Live News", for: .normal)
        }
        if sender.selectedSegmentIndex == 4 {
            
            collectionViewWorldNews.reloadData()
            tableViewWorldNews.reloadData()
        }
    }
    
    func getJsonDataWorldNewsCollectionView() {
        
        let url = URL(string: "https://newsdata.io/api/1/news?apikey=pub_64485265a799cbc74a7d5e9ac64dfa4da8fd&q=Ukraine&language=en&category=top")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    let getJsonData = try JSONDecoder().decode(RootWorldNews.self, from: data)
                    
                    self.jsonDataWorldNewsCollctionView = getJsonData
                    
                    DispatchQueue.main.async {
                        self.collectionViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForTableViewWorldNews() {
        
        let url = URL(string: "https://newsdata.io/api/1/news?apikey=pub_64485265a799cbc74a7d5e9ac64dfa4da8fd&q=World%20war&language=en&category=top")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let jsonDataTableView = try JSONDecoder().decode(RootWorldNewsTableView.self, from: data)
                    
                    self.jsonDataWorldNewsTableView = jsonDataTableView
                    
                    DispatchQueue.main.async {
                        
                        self.tableViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForBusinessNewsCollectionView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(BussinesRoot.self, from: data)
                    
                    self.jsonDataBusinessCollectionView = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.collectionViewWorldNews.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForBusinessNewsTableView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(BussinesRoot.self, from: data)
                    
                    self.jsonDataBusinessTableView = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.tableViewWorldNews.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForHealthCollectionView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    let jsonData = try JSONDecoder().decode(HealthRoot.self, from: data)
                    
                    self.jsonDataHealthColectionView = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.collectionViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForHealthNewsTableView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&category=health&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    let jsonData = try JSONDecoder().decode(HealthRoot.self, from: data)
                    
                    self.jsonDataHealthTableView = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.tableViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForSportNewsCollectionView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    let jsonData = try JSONDecoder().decode(SportNewsRoot.self, from: data)
                    
                    self.jsonDataSportCollectionView = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.collectionViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForSportNewsTableView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&category=sports&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(SportNewsRoot.self, from: data)
                    
                    self.jsonDataSportTableVIew = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.tableViewWorldNews.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForTechNewsCollectionView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let dataFromJson = try JSONDecoder().decode(Root.self, from: data)
                    
                    self.jsonDataTechCollectionView = dataFromJson
                    
                    DispatchQueue.main.async {
                        self.collectionViewWorldNews.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getJsonDataForTechNewsTableView() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=gb&category=technology&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    
                    let dataFromJsonTableView = try JSONDecoder().decode(Root.self, from: data)
                    
                    self.jsonDataTechTableView = dataFromJsonTableView
                    
                    DispatchQueue.main.async {
                        self.tableViewWorldNews.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func liveButtonPressed(_ sender: Any) {
        
        if segmentTopicBar.selectedSegmentIndex == 3 {
            
            let liveScoreVC = storyboard?.instantiateViewController(withIdentifier: LiveScoreViewController.identifier) as! LiveScoreViewController
            
            navigationController?.pushViewController(liveScoreVC, animated: true)
            
        } else {
            
            let liveNewsVC = storyboard?.instantiateViewController(withIdentifier: LiveNewsViewController.identifier) as! LiveNewsViewController
            
            navigationController?.pushViewController(liveNewsVC, animated: true)
        }
    }
}

extension WorldNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            return jsonDataBusinessCollectionView?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 2 {
            
            return jsonDataHealthColectionView?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 3 {
            
            return jsonDataSportCollectionView?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 4 {
            
            return jsonDataTechCollectionView?.articles.count ?? 0
        }
        return jsonDataWorldNewsCollctionView?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionViewWorldNews.dequeueReusableCell(withReuseIdentifier: WorldNewsCollectionViewCell.identifier, for: indexPath) as! WorldNewsCollectionViewCell
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            let dataForCellBussines = jsonDataBusinessCollectionView?.articles[indexPath.row]
            
            collectionCell.collectionCellTitle.text = dataForCellBussines?.title
            collectionCell.imageCollectionViewCell.layer.cornerRadius = 7
            collectionCell.gradientImageBlack.layer.cornerRadius = 7
            
            if dataForCellBussines?.urlToImage != nil {
                
                guard let url = URL(string: (dataForCellBussines?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let collectionImageData = try? Data(contentsOf: url) {
                        
                        DispatchQueue.main.async {
                            collectionCell.imageCollectionViewCell.image = UIImage(data: collectionImageData)
                        }
                    }
                }
                
            } else {
                
                collectionCell.imageCollectionViewCell.image = UIImage(named: "defaultPhoto5")
            }
            
            return collectionCell
            
        } else if segmentTopicBar.selectedSegmentIndex == 2 {
            
            let dataForCellHealth = jsonDataHealthColectionView?.articles[indexPath.row]
            
            collectionCell.collectionCellTitle.text = dataForCellHealth?.title
            collectionCell.imageCollectionViewCell.layer.cornerRadius = 7
            collectionCell.gradientImageBlack.layer.cornerRadius = 7
            
            if dataForCellHealth?.urlToImage != nil {
                
                guard let url = URL(string: (dataForCellHealth?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let collectionImageData = try? Data(contentsOf: url) {
                        
                        DispatchQueue.main.async {
                            collectionCell.imageCollectionViewCell.image = UIImage(data: collectionImageData)
                        }
                    }
                }
                
            } else {
                
                collectionCell.imageCollectionViewCell.image = UIImage(named: "defaultPhotoHealth")
            }
            
            return collectionCell
            
        } else if segmentTopicBar.selectedSegmentIndex == 3 {
            
            let dataForCellSport = jsonDataSportCollectionView?.articles[indexPath.row]
            
            collectionCell.collectionCellTitle.text = dataForCellSport?.title
            collectionCell.imageCollectionViewCell.layer.cornerRadius = 7
            collectionCell.gradientImageBlack.layer.cornerRadius = 7
            
            if dataForCellSport?.urlToImage != nil {
                
                guard let url = URL(string: (dataForCellSport?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let collectionImageData = try? Data(contentsOf: url) {
                        
                        DispatchQueue.main.async {
                            collectionCell.imageCollectionViewCell.image = UIImage(data: collectionImageData)
                        }
                    }
                }
                
            } else {
                
                collectionCell.imageCollectionViewCell.image = UIImage(named: "defaultPhoto3")
            }
            
            return collectionCell
            
        } else if segmentTopicBar.selectedSegmentIndex == 4 {
            
            let dataForCellTech = jsonDataTechCollectionView?.articles[indexPath.row]
            
            collectionCell.collectionCellTitle.text = dataForCellTech?.title
            collectionCell.imageCollectionViewCell.layer.cornerRadius = 7
            collectionCell.gradientImageBlack.layer.cornerRadius = 7
            
            if dataForCellTech?.urlToImage != nil {
                
                guard let url = URL(string: (dataForCellTech?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let collectionImageData = try? Data(contentsOf: url) {
                        
                        DispatchQueue.main.async {
                            collectionCell.imageCollectionViewCell.image = UIImage(data: collectionImageData)
                        }
                    }
                }
                
            } else {
                
                collectionCell.imageCollectionViewCell.image = UIImage(named: "defaultPhoto6")
            }
            
            return collectionCell
        }
        
        let dataForCell = jsonDataWorldNewsCollctionView?.results[indexPath.row]
        
        collectionCell.collectionCellTitle.text = dataForCell?.title
        collectionCell.imageCollectionViewCell.layer.cornerRadius = 7
        collectionCell.gradientImageBlack.layer.cornerRadius = 7
        
        if dataForCell?.imageUrl != nil {
            
            guard let url = URL(string: (dataForCell?.imageUrl)!) else {
                
                fatalError()
            }
            DispatchQueue.global(qos: .userInitiated).async {
                
                if let collectionImageData = try? Data(contentsOf: url) {
                    
                    DispatchQueue.main.async {
                        collectionCell.imageCollectionViewCell.image = UIImage(data: collectionImageData)
                    }
                }
            }
            
        } else {
            
            collectionCell.imageCollectionViewCell.image = UIImage(named: "defaultPhoto")
        }
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: ArticleDetailsViewController.identifier) as! ArticleDetailsViewController
        
        if segmentTopicBar.selectedSegmentIndex == 0 {
            
            let dataDetails = jsonDataWorldNewsCollctionView?.results[indexPath.row]
            
            if dataDetails?.imageUrl != nil {
                
                let imageUrl = URL(string: (dataDetails?.imageUrl)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.link)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
                
            }
            
            if dataDetails?.creator != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.creator?[0])!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.sourceId != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.sourceId)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            let dataDetailsBusiness = jsonDataBusinessCollectionView?.articles[indexPath.row]
            
            if dataDetailsBusiness?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetailsBusiness?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto5")!
            }
            
            detailsVC.titleForArticle = (dataDetailsBusiness?.title)!
            detailsVC.getLink = (dataDetailsBusiness?.url)!
            
            if dataDetailsBusiness?.content != nil {
                
                detailsVC.textForArticle = (dataDetailsBusiness?.content)!
                
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetailsBusiness?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetailsBusiness!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetailsBusiness?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetailsBusiness?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 2 {
            
            let dataDetailsHealth = jsonDataHealthColectionView?.articles[indexPath.row]
            
            if dataDetailsHealth?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetailsHealth?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhotoHealth")!
            }
            
            detailsVC.titleForArticle = (dataDetailsHealth?.title)!
            detailsVC.getLink = (dataDetailsHealth?.url)!
            
            if dataDetailsHealth?.content != nil {
                
                detailsVC.textForArticle = (dataDetailsHealth?.content)!
                
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetailsHealth?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetailsHealth!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetailsHealth?.source.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetailsHealth?.source.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 3 {
            
            let dataDetailsSport = jsonDataSportCollectionView?.articles[indexPath.row]
            
            if dataDetailsSport?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetailsSport?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto3")!
            }
            
            detailsVC.titleForArticle = (dataDetailsSport?.title)!
            detailsVC.getLink = (dataDetailsSport?.url)!
            
            if dataDetailsSport?.content != nil {
                
                detailsVC.textForArticle = (dataDetailsSport?.content)!
                
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetailsSport?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetailsSport!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetailsSport?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetailsSport?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 4 {
            
            let dataDetailsTech = jsonDataTechCollectionView?.articles[indexPath.row]
            
            if dataDetailsTech?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetailsTech?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto6")!
            }
            
            detailsVC.titleForArticle = (dataDetailsTech?.title)!
            detailsVC.getLink = (dataDetailsTech?.url)!
            
            if dataDetailsTech?.content != nil {
                
                detailsVC.textForArticle = (dataDetailsTech?.content)!
                
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetailsTech?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetailsTech!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetailsTech?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetailsTech?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension WorldNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            return jsonDataBusinessTableView?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 2 {
            
            return jsonDataHealthTableView?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 3 {
            
            return jsonDataSportTableVIew?.articles.count ?? 0
            
        } else if segmentTopicBar.selectedSegmentIndex == 4 {
            
            return jsonDataTechTableView?.articles.count ?? 0
        }
        return jsonDataWorldNewsTableView?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellworldNews = tableViewWorldNews.dequeueReusableCell(withIdentifier: WorldNewsTableViewCell.identifier, for: indexPath) as! WorldNewsTableViewCell
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            let dataForCell = jsonDataBusinessTableView?.articles[indexPath.row]
            
            cellworldNews.titleWorldNewsCell.text = dataForCell?.title
            cellworldNews.imageWorldNewsCell.layer.cornerRadius = 7
            
            if dataForCell?.urlToImage != nil {
                
                    guard let imageUrl = URL(string: (dataForCell?.urlToImage)!) else {
                        
                        fatalError()
                    }
                    DispatchQueue.global(qos: .userInitiated).async {
                        
                        if let tableBusinessImage = try? Data(contentsOf: imageUrl) {
                            
                            DispatchQueue.main.async {
                                
                                cellworldNews.imageWorldNewsCell.image = UIImage(data: tableBusinessImage)
                            }
                        }
                    }

            } else {
                
                cellworldNews.imageWorldNewsCell.image = UIImage(named: "defaultPhoto5")
            }
            
            return cellworldNews
            
        } else if segmentTopicBar.selectedSegmentIndex == 2 {
            
            let dataForCellHealth = jsonDataHealthTableView?.articles[indexPath.row]
            
            cellworldNews.titleWorldNewsCell.text = dataForCellHealth?.title
            cellworldNews.imageWorldNewsCell.layer.cornerRadius = 7
            
            if dataForCellHealth?.urlToImage != nil {
                
                guard let imageUrl = URL(string: (dataForCellHealth?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        
                        DispatchQueue.main.async {
                            cellworldNews.imageWorldNewsCell.image = UIImage(data: imageData)
                        }
                    }
                }
            } else {
                
                cellworldNews.imageWorldNewsCell.image = UIImage(named: "defaultPhotoHealth")
            }
            
            return cellworldNews
            
        } else if segmentTopicBar.selectedSegmentIndex == 3 {
            
            let dataForCellSport = jsonDataSportTableVIew?.articles[indexPath.row]
            
            cellworldNews.titleWorldNewsCell.text = dataForCellSport?.title
            cellworldNews.imageWorldNewsCell.layer.cornerRadius = 7
            
            if dataForCellSport?.urlToImage != nil {
                
                guard let imageUrl = URL(string: (dataForCellSport?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        
                        DispatchQueue.main.async {
                            cellworldNews.imageWorldNewsCell.image = UIImage(data: imageData)
                        }
                    }
                }
            } else {
                
                cellworldNews.imageWorldNewsCell.image = UIImage(named: "defaultPhoto3")
            }
            
            return cellworldNews
            
        } else if segmentTopicBar.selectedSegmentIndex == 4 {
            
            let dataForCellTech = jsonDataTechTableView?.articles[indexPath.row]
            
            cellworldNews.titleWorldNewsCell.text = dataForCellTech?.title
            cellworldNews.imageWorldNewsCell.layer.cornerRadius = 7
            
            if dataForCellTech?.urlToImage != nil {
                
                guard let imageUrl = URL(string: (dataForCellTech?.urlToImage)!) else {
                    
                    fatalError()
                }
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        
                        DispatchQueue.main.async {
                            
                            cellworldNews.imageWorldNewsCell.image = UIImage(data: imageData)
                        }
                    }
                }
                
            } else {
                
                cellworldNews.imageWorldNewsCell.image = UIImage(named: "defaultPhoto6")
            }
            
            return cellworldNews
        }
        
        let dataForTableViewCell = jsonDataWorldNewsTableView?.results[indexPath.row]
        
        cellworldNews.titleWorldNewsCell.text = dataForTableViewCell?.title
        cellworldNews.imageWorldNewsCell.layer.cornerRadius = 7
        
        if dataForTableViewCell?.imageUrl != nil {
            
            guard let imageUrl = URL(string: (dataForTableViewCell?.imageUrl)!) else {
                
                fatalError()
            }
            DispatchQueue.global(qos: .userInitiated).async {
                if let tableImagedata = try? Data(contentsOf: imageUrl) {
                    
                    DispatchQueue.main.async {
                        cellworldNews.imageWorldNewsCell.image = UIImage(data: tableImagedata)
                    }
                }
            }
        } else {
            
            cellworldNews.imageWorldNewsCell.image = UIImage(named: "defaultPhoto2")
        }
        
        return cellworldNews
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableViewWorldNews.deselectRow(at: indexPath, animated: true)
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: ArticleDetailsViewController.identifier) as! ArticleDetailsViewController
        
        if segmentTopicBar.selectedSegmentIndex == 0 {
            
            let dataDetails = jsonDataWorldNewsTableView?.results[indexPath.row]
            
            if dataDetails?.imageUrl != nil {
                
                let imageUrl = URL(string: (dataDetails?.imageUrl)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.link)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
                
            }
            
            if dataDetails?.creator != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.creator?[0])!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.sourceId != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.sourceId)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 1 {
            
            let dataDetails = jsonDataBusinessTableView?.articles[indexPath.row]
            
            if dataDetails?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetails?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto5")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.url)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetails?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 2 {
            
            let dataDetails = jsonDataHealthTableView?.articles[indexPath.row]
            
            if dataDetails?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetails?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhotoHealth")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.url)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
                
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetails?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.source.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.source.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 3 {
            
            let dataDetails = jsonDataSportTableVIew?.articles[indexPath.row]
            
            if dataDetails?.urlToImage != nil {
                
                let imageUrl = URL(string: (dataDetails?.urlToImage)!)
                
                if let dataImage = try? Data(contentsOf: imageUrl!) {
                    
                    detailsVC.imageForArticle = UIImage(data: dataImage)!
                }
                
            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto3")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.url)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetails?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        if segmentTopicBar.selectedSegmentIndex == 4 {
            

            let dataDetails = jsonDataTechTableView?.articles[indexPath.row]
        
            
            if dataDetails?.urlToImage != nil {
                
                    let imageUrl = URL(string: (dataDetails?.urlToImage)!)
                    
                    if let dataImage = try? Data(contentsOf: imageUrl!) {
                        
                            detailsVC.imageForArticle = UIImage(data: dataImage)!
                    }

            } else {
                
                detailsVC.imageForArticle = UIImage(named: "defaultPhoto6")!
            }
            
            detailsVC.titleForArticle = (dataDetails?.title)!
            detailsVC.getLink = (dataDetails?.url)!
            
            if dataDetails?.content != nil {
                
                detailsVC.textForArticle = (dataDetails?.content)!
            } else {
                
                detailsVC.textForArticle = "Visit Full Article"
            }
            
            if dataDetails?.author != nil {
                
                detailsVC.titleForAuthor = "Author: \((dataDetails!.author)!)"
                
            } else {
                
                detailsVC.titleForAuthor = "Author: Unknown"
            }
            
            if dataDetails?.source?.name != nil {
                
                detailsVC.titleForSource = "Source: \((dataDetails?.source?.name)!)"
                
            } else {
                
                detailsVC.titleForSource = "Source: Unknown"
            }
        }
        
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

