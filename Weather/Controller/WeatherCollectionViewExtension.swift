//
//  WeatherCollectionViewExtension.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/22/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import UIKit
import Nuke

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width
        let yourHeight = weatherCellHeight

        return CGSize(width: yourWidth, height: yourHeight)
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherViewModel.weather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let data = weatherViewModel.weather[indexPath.row]
        cell.cityName.text = data.name
        cell.temperature.text = "Temperature: \(data.main?.temp.stringValue ?? "")"
        cell.weatherDesc.text = data.weather.first?.weatherDescription
        cell.humidity.text = "Humidity: \((data.main?.humidity) ?? 0)%"
        if let url = URL(string: data.weather.first?.iconStringURL ?? "")  {
            Nuke.loadImage(
                with: url,
                into: cell.weatherImage
            )
        }
        
        return cell
    }
    
    
}
