//
//  ViewController.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import UIKit

class TechViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var jsonData: Root?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getJsonDataTechNews()
    }
    
    func getJsonDataTechNews() {
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=0930eedfeb574964ac27b8c59d037df7")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let dataFromJson = try JSONDecoder().decode(Root.self, from: data)
                    
                    self.jsonData = dataFromJson
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TechNewsTableViewCell.identifier) as? TechNewsTableViewCell else {
            fatalError()
        }
        let dataForCell = jsonData?.articles[indexPath.row]
        
        cell.titleTechNews.text = dataForCell?.title
        cell.titleSourceName.text = "Source: \(dataForCell?.source?.name ?? "Tech News")"
        cell.imageTechNews.layer.cornerRadius = 7
        
        if dataForCell?.urlToImage != nil {
            
            if let url = URL(string: dataForCell!.urlToImage!) {
               
                DispatchQueue.global(qos: .userInitiated).async {
                    let data = try? Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                        cell.imageTechNews.image = UIImage(data: data!)
                    }
                }
            }
        } else {
            cell.imageTechNews.image = UIImage(named: "defaultPhoto6")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let secondScreen = storyboard?.instantiateViewController(withIdentifier: SecondScreenTechNewsVC.identifierStoryboard) as? SecondScreenTechNewsVC else {
            
            return
        }
        
        let dataForSecondScreen = jsonData?.articles[indexPath.row]
        
        if dataForSecondScreen?.urlToImage != nil {
            
            guard let url = URL(string: dataForSecondScreen!.urlToImage!) else {
                
                fatalError()
            }
            let data = try? Data(contentsOf: url)
            
            secondScreen.imageForSecondScreen = UIImage(data: data!)!

        } else {
            secondScreen.imageForSecondScreen = UIImage(named: "defaultPhoto6")!
        }
        secondScreen.titleSecondScreenTN = dataForSecondScreen!.title!
        secondScreen.textSecondScreenTN = dataForSecondScreen!.content ?? "Visit Full article link below..."
        secondScreen.getLink = dataForSecondScreen!.url!
        secondScreen.sourceNameSecondScreen = "Source: \((dataForSecondScreen?.source?.name)!)"
        secondScreen.authorNameSecondScreen = "By \((dataForSecondScreen?.author) ?? "unknown publisher")"
        
        self.navigationController?.pushViewController(secondScreen, animated: true)
    }
}


