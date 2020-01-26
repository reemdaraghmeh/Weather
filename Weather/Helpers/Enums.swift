//
//  Enums.swift
//  Weather
//
//  Created by Reem Daraghmeh on 1/24/20.
//  Copyright © 2020 Reem Daraghmeh. All rights reserved.
//

import Foundation

enum City: String {
    case amman
    case irbid
    case aqaba
}

enum FailureError : String {
    case jsonEncodingFailed = "JSON Encoding Failed"
    case emptyData = "Empty Data"
}
