//
//  DailySummaryResult.swift
//  TinyWeather
//
//  Created by Paul Downs on 13/11/2026.
//

import Foundation
import RxSwift

struct HourlyForecastResult: CustomDebugStringConvertible {
    let feelsLikeTemperatureC: [Double]
    let gustSpeedMph: [Double]
    let humidity: [Double]
    let localDate: [String]
    let precipitationProbabilityInPercent: [Double?]
    let pressure: [Double]
    let temperatureC: [Double]
    let timeslot: [String]
    let visibility: [String]
    let weatherTypeText: [String]
    let windDirection: [String]
    let windSpeedMph: [Double]
    
    static func parseJSON(_ json: NSDictionary) throws -> HourlyForecastResult {
        guard
            let feelsLikeTemperatureC = json.value(forKey: "feelsLikeTemperatureC") as? [Double],
            let gustSpeedMph = json.value(forKey: "gustSpeedMph") as? [Double],
            let humidity = json.value(forKey: "humidity") as? [Double],
            let localDate = json.value(forKey: "localDate") as? [String],
            let precipitationProbabilityInPercent = json.value(forKey: "precipitationProbabilityInPercent") as? [Double?],
            let pressure = json.value(forKey: "pressure") as? [Double],
            let temperatureC = json.value(forKey: "temperatureC") as? [Double],
            let timeslot = json.value(forKey: "timeslot") as? [String],
            let visibility = json.value(forKey: "visibility") as? [String],
            let weatherTypeText = json.value(forKey: "weatherTypeText") as? [String],
            let windDirection = json.value(forKey: "windDirection") as? [String],
            let windSpeedMph = json.value(forKey: "windSpeedMph") as? [Double]
        else {
            throw apiError("Error parsing page content")
        }

        return HourlyForecastResult(feelsLikeTemperatureC: feelsLikeTemperatureC, gustSpeedMph: gustSpeedMph, humidity: humidity, localDate: localDate, precipitationProbabilityInPercent: precipitationProbabilityInPercent, pressure: pressure, temperatureC: temperatureC, timeslot: timeslot, visibility: visibility, weatherTypeText: weatherTypeText, windDirection: windDirection, windSpeedMph: windSpeedMph)
    }
}

extension HourlyForecastResult {
    var debugDescription: String {
        "Hourly forecast from \(timeslot.first ?? "unknown") to \(timeslot.last ?? "unknown")"
    }
}
