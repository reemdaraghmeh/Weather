//
//  WeatherCell.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/24/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherDesc: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func awakeFromNib() {
        
    }
}
