//
//  ForecastViewController.swift
//  Recent News
//
//  Created by Filip  on 12.4.22..
//

import UIKit
import CoreData
import CachyKit

class ForecastViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var cityTitle: UILabel!
    @IBOutlet weak var temperatureTitle: UILabel!
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var feelsLikeTitle: UILabel!
    @IBOutlet weak var alphaBackgroundView: UIView!
    @IBOutlet weak var alphaGrayTemperature: UIView!
    @IBOutlet weak var weatherTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imageWeatherConditions: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var jsonDataWeather: WeatherRoot?
    var savedJsonData: [ForecastData] = []
    var cityName = ""
    var backgroundImageName = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
        searchButton.tintColor = UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 0.80)
        weatherTableView.layer.cornerRadius = 7
        alphaBackgroundView.layer.cornerRadius = 7
        alphaGrayTemperature.layer.cornerRadius = 7
        backgroundImage.image = UIImage(named: "fewClouds")
       
        let fetchRequest: NSFetchRequest<ForecastData> = ForecastData.fetchRequest()
        do {
          let forecast = try PersistenceService.context.fetch(fetchRequest)
           
            self.savedJsonData = forecast
            
            weatherTableView.reloadData()
        } catch {}
        
        savedDataForDefaultWeatherData()
        keybordSetup()
    }
    
    func backgroundImageSetup(name: String) {
        
        backgroundImage.image = UIImage(named: name)
    }
    
    func getWeatherJsonData() {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName.replacingOccurrences(of: " ", with: "+"))&appid=e4efcd7ffee393bd977019f8e38539f7&units=metric")
        
        else {
            fatalError()
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let jsonWeatherData = try? JSONDecoder().decode(WeatherRoot.self, from: data!) {
            
                self.jsonDataWeather = jsonWeatherData
                
                DispatchQueue.main.async {
                    
                    if self.jsonDataWeather?.main?.temp != nil {

                    self.temperatureTitle.text = " \(Int((self.jsonDataWeather!.main?.temp!)!))°"
                    self.cityTitle.text = self.jsonDataWeather?.name
                    self.descriptionTitle.text = jsonWeatherData.weather?[0].description?.capitalized
                    self.feelsLikeTitle.text = "Feels Like \(Int((jsonWeatherData.main?.feelsLike ?? 0.0)))°"

                    let weatherData = ForecastData(context: PersistenceService.context)
                   
                    weatherData.name = self.jsonDataWeather?.name
                    weatherData.feelsLike = (self.jsonDataWeather?.main?.feelsLike)!
                    weatherData.temp = (self.jsonDataWeather?.main?.temp)!
                    weatherData.main = self.jsonDataWeather?.weather?[0].description
                    
                    switch weatherData.main {
                        
                    case "few clouds":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                        
                        let imageNameFewClouds = "fewClouds"
                        
                        self.backgroundImageSetup(name: imageNameFewClouds)
                        
                        self.view.reloadInputViews()

                    case "clear sky":

                        self.imageWeatherConditions.image = UIImage(systemName: "sun.max")
                        
                        let imageNameClearSky = "clearSky"
                        
                        
                        self.backgroundImageSetup(name: imageNameClearSky)
                        
                        self.view.reloadInputViews()
        
                    case "moderate rain":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                        
                        let imageNameModerateRain = "rain"
                        
                        self.backgroundImageSetup(name: imageNameModerateRain)
                        
                    case "scattered clouds":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                        
                        let imageNameScatteredClouds = "sunClouds"
                        
                        self.backgroundImageSetup(name: imageNameScatteredClouds)
                        
                    case "light rain":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                        
                        let imageNameLightRain = "rain"
                        
                        self.backgroundImageSetup(name: imageNameLightRain)
                        
                    case "thunderstorm":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.bolt.rain")
                        
                        let imageNameThunder = "thunderStorm"
                        
                        
                        self.backgroundImageSetup(name: imageNameThunder)
                        
                    case "broken clouds":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                        
                        let imageNameBrokenClouds = "brokenClouds"
                        
                        self.backgroundImageSetup(name: imageNameBrokenClouds)
                        
                    case "overcast clouds":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud")
                        
                        let imageNameOverCastClouds = "clouds"
                        
                        self.backgroundImageSetup(name: imageNameOverCastClouds)
                        
                        self.view.reloadInputViews()
                        
                    case "shower rain":
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                        
                        let imageNameShowerRain = "rain"
                        
                        self.backgroundImageSetup(name: imageNameShowerRain)
    
                    default:
                        
                        self.imageWeatherConditions.image = UIImage(systemName: "questionmark")
                        
                        let imageNameDefault = "fewClouds"
                        
                        self.backgroundImageSetup(name: imageNameDefault)
                    }
                        
                    PersistenceService.saveContext()
                    self.savedJsonData.append(weatherData)
                    self.weatherTableView.reloadData()
                    self.reloadInputViews()
                        
                   } else {
                       
                       let generator = UINotificationFeedbackGenerator()
                       generator.prepare()
                       generator.notificationOccurred(.error)
                       
                       let alert = UIAlertController(title: "Incorrect City Name!", message: "Please enter correct city name...", preferredStyle: .alert)
                       alert.addAction(.init(title: "ok", style: .default, handler: nil))
                    
                       self.present(alert, animated: true)
                   }
                }
            }
        }
        task.resume()
    }
    
    func savedDataForDefaultWeatherData() {
        
        if savedJsonData.isEmpty == true  {
            
            cityTitle.text = ""
            temperatureTitle.text = ""
            descriptionTitle.text = ""
            feelsLikeTitle.text = ""

        } else {
            
            cityTitle.text = savedJsonData[0].name
            temperatureTitle.text = "\(Int(savedJsonData[0].temp))°"
            descriptionTitle.text = savedJsonData[0].main?.description.capitalized
            feelsLikeTitle.text = "Feels Like \(Int(savedJsonData[0].feelsLike))°"
            
            switch savedJsonData[0].main {
                
            case "few clouds":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                
                let imageNameFewClouds = "fewClouds"
                
                self.backgroundImageSetup(name: imageNameFewClouds)
                
                self.view.reloadInputViews()
                
            case "clear sky":

                self.imageWeatherConditions.image = UIImage(systemName: "sun.max")
                
                let imageNameClearSky = "clearSky"
                
                
                self.backgroundImageSetup(name: imageNameClearSky)
                
                self.view.reloadInputViews()

            case "moderate rain":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                
                let imageNameModerateRain = "rain"
                
                self.backgroundImageSetup(name: imageNameModerateRain)
                
            case "scattered clouds":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                
                let imageNameScatteredClouds = "sunClouds"
                
                self.backgroundImageSetup(name: imageNameScatteredClouds)
                
            case "light rain":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                
                let imageNameLightRain = "rain"
                
                self.backgroundImageSetup(name: imageNameLightRain)
                
            case "thunderstorm":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.bolt.rain")
                
                let imageNameThunder = "thunderStorm"
                
                self.backgroundImageSetup(name: imageNameThunder)
                
            case "broken clouds":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
                
                let imageNameBrokenClouds = "brokenClouds"
                
                self.backgroundImageSetup(name: imageNameBrokenClouds)
                
            case "overcast clouds":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud")
                
                let imageNameOverCastClouds = "clouds"
                
                self.backgroundImageSetup(name: imageNameOverCastClouds)
                
                self.view.reloadInputViews()
                
            case "shower rain":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
                
                let imageNameShowerRain = "rain"
                
                self.backgroundImageSetup(name: imageNameShowerRain)
                
            case "fog":
                
                self.imageWeatherConditions.image = UIImage(systemName: "cloud.fog")
                
                let imageNameShowerRain = "fog"
                
                self.backgroundImageSetup(name: imageNameShowerRain)

            default:
                
                self.imageWeatherConditions.image = UIImage(systemName: "questionmark")
                
                let imageNameDefault = "fewClouds"
                
                self.backgroundImageSetup(name: imageNameDefault)
            }
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        if searchTextField.text == "" {
          
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(.error)
            
            self.view.endEditing(true)
            
            let alert = UIAlertController(title: "Add a city name!", message: "Please enter correct city name...", preferredStyle: .alert)
            alert.addAction(.init(title: "ok", style: .default, handler: nil))
        
            present(alert, animated: true)

        } else {
            
            cityName = searchTextField.text!
            getWeatherJsonData()
            searchTextField.text = ""
            weatherTableView.reloadData()
        }
        self.view.endEditing(true)
    }
    
    func deleteData(dataForErase: NSManagedObject) {
        
        let coreData = dataForErase
        
        PersistenceService.context.delete(coreData)
        PersistenceService.saveContext()
    }
    
    private func keybordSetup() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillshow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

extension ForecastViewController {
    
    @objc func keyboardWillshow(sender: NSNotification) {
        
        if view.frame.origin.y >= 0 {
            
            view.frame.origin.y = view.frame.origin.y - 280
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        view.frame.origin.y = 0
    }

}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return savedJsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let weatherCell = weatherTableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as! ForecastTableViewCell
               
        
        let savedData = savedJsonData[indexPath.row]
        
        weatherCell.backgroundGrayView.layer.cornerRadius = 7
       
        weatherCell.cityTitle.text = savedData.name
        weatherCell.temperatureTitle.text = "\(Int(savedData.temp))"
        print(savedData.main!)
        
        switch savedData.main {
            
        case "few clouds":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.sun")
            
        case "clear sky":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "sun.max")
            
        case "moderate rain":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.rain")
            
        case "scattered clouds":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.sun")
            
        case "light rain":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.rain")
            
        case "thunderstorm":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.bolt.rain")
            
        case "broken clouds":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.sun")
            
        case "overcast clouds":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud")
            
        case "shower rain":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.rain")
            
        case "fog":
            
            weatherCell.conditionsImage.image = UIImage(systemName: "cloud.fog")
            
            let imageNameShowerRain = "fog"
            
            self.backgroundImageSetup(name: imageNameShowerRain)

        default:
            
            weatherCell.conditionsImage.image = UIImage(systemName: "questionmark")
    
        }
        return weatherCell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

        return .delete
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let dataForDelete = savedJsonData[indexPath.row]
        
        if editingStyle == .delete {
            
            deleteData(dataForErase: dataForDelete)
            
            savedJsonData.remove(at: indexPath.row)
            weatherTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let dataForCell = savedJsonData[indexPath.row]
        
        cityTitle.text = dataForCell.name
        temperatureTitle.text = "\(Int(dataForCell.temp))°"
        feelsLikeTitle.text = "Feels Like \(Int(dataForCell.feelsLike))°"
        descriptionTitle.text = dataForCell.main?.capitalized
        
        switch dataForCell.main {
            
        case "few clouds":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
            
            let imageNameFewClouds = "fewClouds"
            
            self.backgroundImageSetup(name: imageNameFewClouds)
            
            self.view.reloadInputViews()

            
        case "clear sky":

            self.imageWeatherConditions.image = UIImage(systemName: "sun.max")
            
            let imageNameClearSky = "clearSky"
            
            
            self.backgroundImageSetup(name: imageNameClearSky)
            
            self.view.reloadInputViews()


        case "moderate rain":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
            
            let imageNameModerateRain = "rain"
            
            self.backgroundImageSetup(name: imageNameModerateRain)
            

        case "scattered clouds":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
            
            let imageNameScatteredClouds = "sunClouds"
            
            self.backgroundImageSetup(name: imageNameScatteredClouds)
            
        case "light rain":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
            
            let imageNameLightRain = "rain"
            
            self.backgroundImageSetup(name: imageNameLightRain)
            
        case "thunderstorm":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.bolt.rain")
            
            let imageNameThunder = "thunderStorm"
            
            
            self.backgroundImageSetup(name: imageNameThunder)
            
        case "broken clouds":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.sun")
            
            let imageNameBrokenClouds = "brokenClouds"
            
            self.backgroundImageSetup(name: imageNameBrokenClouds)
            
        case "overcast clouds":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud")
            
            let imageNameOverCastClouds = "clouds"
            
            self.backgroundImageSetup(name: imageNameOverCastClouds)
            
            self.view.reloadInputViews()
            
        case "shower rain":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.rain")
            
            let imageNameShowerRain = "rain"
            
            self.backgroundImageSetup(name: imageNameShowerRain)
            
        case "fog":
            
            self.imageWeatherConditions.image = UIImage(systemName: "cloud.fog")
            
            let imageNameShowerRain = "fog"
            
            self.backgroundImageSetup(name: imageNameShowerRain)

        default:
            
            self.imageWeatherConditions.image = UIImage(systemName: "questionmark")
            
            let imageNameDefault = "fewClouds"
            
            self.backgroundImageSetup(name: imageNameDefault)
        }
    }
}


