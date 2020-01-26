//
//  GetWeatherRequest.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/24/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//
import Foundation
import Alamofire

struct GetWeatherRequest: EndPointType {
    
    let city: String
    let units = "metric"
    
    init(city: String) {
        self.city = city
    }
    
    var query: String {
        let params = ["q": city,
                      "units": units,
                      "APPID":Constants.AppID]
        var output: String = ""
        for (key,value) in params {
            output +=  "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        return output
        
    }
    var params: [String : Any]?{
        return nil
    }
    
    
    var path: String {
        return "data/2.5/weather?"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
