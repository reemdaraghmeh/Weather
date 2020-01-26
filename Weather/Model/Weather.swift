



import Foundation
import RealmSwift

// MARK: - Weather
class Weather: Object, Codable {
    @objc dynamic var coord: Coord?
    var weather = List<WeatherElement>()
    @objc dynamic var base: String?
    @objc dynamic var main: Main?
    @objc dynamic var visibility: Int = 0
    @objc dynamic var wind: Wind?
    @objc dynamic var clouds: Clouds?
    @objc dynamic var dt: Int = 0
    @objc dynamic var sys: Sys?
    @objc dynamic var timezone: Int = 0
    @objc dynamic var id: Int = 0

    @objc dynamic var name: String?
    @objc dynamic var cod: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

// MARK: - Clouds
class Clouds: Object, Codable {
    @objc dynamic var all: Int = 0
}

// MARK: - Coord
class Coord: Object, Codable {
    @objc dynamic var lon: Double = 0
    @objc dynamic var lat: Double = 0
}

// MARK: - Main
class Main: Object, Codable {
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var tempMin: Double = 0
    @objc dynamic var tempMax: Double = 0

    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
class Sys: Object, Codable {
    @objc dynamic var type: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var country: String?
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
}

// MARK: - WeatherElement
class WeatherElement: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var main, weatherDescription, icon: String?

    var iconStringURL: String{
        return "https://openweathermap.org/img/wn/\(icon ?? "")@2x.png"
    }
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
class Wind: Object, Codable {
    @objc dynamic var speed: Double = 0
    @objc dynamic var deg: Int = 0
}
