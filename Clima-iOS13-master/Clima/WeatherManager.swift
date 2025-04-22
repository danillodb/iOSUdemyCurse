//
//  WeatherManager.swift
//  Clima
//
//  Created by Danillo Diniz Barbosa on 12/04/25.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct CityModel: Codable {
    let lat: Double
    let lon: Double
    let name: String
    
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        lat = latitude
        lon = longitude
    }
}

struct WeatherMainModel: Codable {
    let name: String
    let weather: [WeatherModel]
    let main: MainModel
}

struct WeatherModel: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
    
    var conditionImage: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
    }
}

struct MainModel: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    
    var temperature: String {
        return String(format: "%.0f", temp)
    }
}

protocol WeatherManagerDelegate {
    func didUpdateCity(_ city: CityModel?)
    func didUpdateWeather(_ weatherMain: WeatherMainModel?)
    func didWeatherFailWithError(_ error: Error)
}

class WeatherManager {
    let apiKey: String = "9bfeb84ad9591f82424153c904e6c505"
    let baseURL: String = "https://api.openweathermap.org"
    let coordinatesURL: String = "/geo/1.0/direct?limit=1"
    let weatherURL: String = "/data/2.5/weather?units=metric&lang=pt_br"
    var delegate: WeatherManagerDelegate?
    
    func getCoordinates(cityName: String) {
        let urlString = "\(baseURL)\(coordinatesURL)&q=\(cityName)&appid=\(apiKey)"
        //1.Create URL; 2.Create URLSession; 3.Get Task from Session; 4. Execute Task
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didWeatherFailWithError(error!)
                    return
                }
                let city = self.parseCityData(with: data)
                self.delegate?.didUpdateCity(city)
            }
            task.resume()
        }
    }
    
    private func parseCityData(with data: Data?) -> CityModel? {
        if let secureData = data {
            print(secureData)
            let decoder = JSONDecoder()
            do {
                let cityArray = try decoder.decode([CityModel].self, from: secureData)
                if !cityArray.isEmpty {
                    return cityArray.first
                }
            } catch {
                self.delegate?.didWeatherFailWithError(error)
            }
        }
        return nil
    }
    
    func getWeather(city: CityModel) {
        let urlString = "\(baseURL)\(weatherURL)&lat=\(city.lat)&lon=\(city.lon)&appid=\(apiKey)"
        //1.Create URL; 2.Create URLSession; 3.Get Task from Session; 4.Execute Task
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didWeatherFailWithError(error!)
                    return
                }
                let weather = self.parseWeatherMainModel(with: data)
                self.delegate?.didUpdateWeather(weather)
            }
            task.resume()
        }
    }
    
    private func parseWeatherMainModel(with data: Data?) -> WeatherMainModel? {
        if let secureData = data {
            print(secureData)
            let decoder = JSONDecoder()
            do {
                return try decoder.decode(WeatherMainModel.self, from: secureData)
            } catch {
                self.delegate?.didWeatherFailWithError(error)
            }
        }
        return nil
    }
}
