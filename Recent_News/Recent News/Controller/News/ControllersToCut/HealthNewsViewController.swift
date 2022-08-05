//
//  HealthNewsViewController.swift
//  Recent News
//
//  Created by Filip  on 5.5.22..
//

import UIKit

class HealthNewsViewController: UIViewController {
    
    @IBOutlet weak var tableViewHealth: UITableView!
    
    var jsonDataForHelthNews: HealthRoot?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHealth.delegate = self
        tableViewHealth.dataSource = self
        getJsonDataHelthNews()
    }
    
    func getJsonDataHelthNews() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                do {
                    let jsonData = try JSONDecoder().decode(HealthRoot.self, from: data)
                    
                    self.jsonDataForHelthNews = jsonData
                    
                    DispatchQueue.main.async {
                        
                        self.tableViewHealth.reloadData()
                    }
                } catch {
                    
                    print(error)
                }
            }
        }
        task.resume()
    }
}

extension HealthNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        jsonDataForHelthNews?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let healthCell = tableViewHealth.dequeueReusableCell(withIdentifier: HealthTableViewCell.identifier, for: indexPath) as! HealthTableViewCell
        
        let jsonDataForCell = jsonDataForHelthNews?.articles[indexPath.row]
        
        healthCell.titleHealth.text = jsonDataForCell?.title
        healthCell.sourceTitle.text = ("Source:\(jsonDataForCell?.source.name ?? "unknown")")
        healthCell.healthImage.layer.cornerRadius = 7
        healthCell.gradientImageBlack.layer.cornerRadius = 7
        
        if jsonDataForCell?.urlToImage != nil {
            
            let url = URL(string: (jsonDataForCell?.urlToImage)!)
            
            DispatchQueue.global().async {
                if let image = try? Data(contentsOf: url!) {
                    
                    DispatchQueue.main.async {
                        healthCell.healthImage.image = UIImage(data: image)
                    }
                }
            }
        } else {
            
            healthCell.healthImage.image = UIImage(named: "defaultPhotoHealth")
        }
        return healthCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 220
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableViewHealth.deselectRow(at: indexPath, animated: true)
    }
}
