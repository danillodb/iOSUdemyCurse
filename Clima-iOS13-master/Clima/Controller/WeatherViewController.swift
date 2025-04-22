//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var textSearch: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupDelegates()
        setPermissions()
        requestLocation()
    }

    @IBAction func searchButtonClick(_ sender: UIButton) {
        textSearch.endEditing(true)
    }
    
    @IBAction func localizationButtonClick(_ sender: UIButton) {
        requestLocation()
    }
    
    func setupDelegates() {
        textSearch.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
    }
    
    func setPermissions() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text!.isEmpty {
            return false
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherManager.getCoordinates(cityName: textField.text!)
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateCity(_ city: CityModel?) {
        if let safeCity = city {
            weatherManager.getWeather(city: safeCity)
        }
    }
    
    func didUpdateWeather(_ weatherMain: WeatherMainModel?) {
        if let safeWeather = weatherMain {
            DispatchQueue.main.async {
                self.textSearch.text = ""
                self.cityLabel.text = safeWeather.name
                self.temperatureLabel.text = String(safeWeather.main.temperature)
                self.conditionImageView.image = UIImage(systemName: safeWeather.weather.first?.conditionImage ?? "cloud")
            }
        }
    }
    
    func didWeatherFailWithError(_ error: Error) {
        print(error)
    }
}

//MARK: - LocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let local = locations.last {
            manager.stopUpdatingLocation()
            let city = CityModel(name: "", latitude: local.coordinate.latitude, longitude: local.coordinate.longitude)
            weatherManager.getWeather(city: city)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Failed to get location: \(error)")
    }
}
