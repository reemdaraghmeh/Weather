//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/22/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import Foundation

class WeatherViewModel {
    
    var weather: [Weather] = []
    
    var onDataDidChange: (() -> Void)? = nil

    //MARK: API
    func getWeatherData(city: City){
        let request = GetWeatherRequest(city: city.rawValue)
        APIManager.shared().request(type: request) { [weak self] (result: ResultResponse<Weather>)  in
            
            switch result{
            case .success(let data):
                self?.weather.append(data)
                self?.saveWeatherObjectToDb(weather: data)
                self?.onDataDidChange?()
                
            case .failure(let error):
                print(error?.errorMessage ?? "Error fetching data")
                
            }
        }
    }
    
    //MARK: Realm Data
    func getCachedWeatherData(){
        if let data = RealmManager.shared.getAllOperation(ofType: Weather.self){
            let weatherDataArray = Array(data) as! [Weather]
            if !weatherDataArray.isEmpty{
                weather = weatherDataArray
                onDataDidChange?()
            }
        }
    }
    
    func saveWeatherObjectToDb(weather: Weather){
        RealmManager.shared.writeOperation(objectOfType: weather)
    }
}
