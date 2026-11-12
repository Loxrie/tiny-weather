//
//  DailyForecastResult.swift
//  TinyWeather
//
//  Created by Paul Downs on 12/11/2026.
//

import Foundation
import RxSwift

struct DailyForecastResult: CustomDebugStringConvertible {
    let gustSpeedMph: [Double]
    let localDate: [String]
    let minTempC: [Double]
    let maxTempC: [Double]
    let mostLikelyHighTemperatureC: [Double]
    let mostLikelyLowTemperatureC: [Double]
    let pollenIndexText: [String?]
    let pollutionIndexText: [String?]
    let precipitationProbabilityInPercent: [Double?]
    let sunrise: [String]
    let sunset: [String]
    let uvIndexText: [String]
    let weatherTypeText: [String]
    let windDirection: [String]
    let windSpeedMph: [Double]
    
    static func parseJSON(_ json: NSDictionary) throws -> DailyForecastResult {
        guard
            let gustSpeedMph =                      json.value(forKey: "gustSpeedMph") as? [Double],
            let localDate =                         json.value(forKey: "localDate") as? [String],
            let minTempC =                          json.value(forKey: "minTempC") as? [Double],
            let maxTempC =                          json.value(forKey: "maxTempC") as? [Double],
            let mostLikelyHighTemperatureC =        json.value(forKey: "mostLikelyHighTemperatureC") as? [Double],
            let mostLikelyLowTemperatureC =         json.value(forKey: "mostLikelyLowTemperatureC") as? [Double],
            let pollenIndexText =                   json.value(forKey: "pollenIndexText") as? [String?],
            let pollutionIndexText =                json.value(forKey: "pollutionIndexText") as? [String?],
            let precipitationProbabilityInPercent = json.value(forKey: "precipitationProbabilityInPercent") as? [Double?],
            let sunrise =                           json.value(forKey: "sunrise") as? [String],
            let sunset =                            json.value(forKey: "sunset") as? [String],
            let uvIndexText =                       json.value(forKey: "uvIndexText") as? [String],
            let weatherTypeText =                   json.value(forKey: "weatherTypeText") as? [String],
            let windDirection =                     json.value(forKey: "windDirection") as? [String],
            let windSpeedMph =                      json.value(forKey: "windSpeedMph") as? [Double]
        else {
            throw apiError("Error parsing page content")
        }

        return DailyForecastResult(gustSpeedMph: gustSpeedMph, localDate: localDate, minTempC: minTempC, maxTempC: maxTempC, mostLikelyHighTemperatureC: mostLikelyHighTemperatureC, mostLikelyLowTemperatureC: mostLikelyLowTemperatureC, pollenIndexText: pollenIndexText, pollutionIndexText: pollutionIndexText, precipitationProbabilityInPercent: precipitationProbabilityInPercent, sunrise: sunrise, sunset: sunset, uvIndexText: uvIndexText, weatherTypeText: weatherTypeText, windDirection: windDirection, windSpeedMph: windSpeedMph)
    }
}

extension DailyForecastResult {
    var debugDescription: String {
        "Daily forecast from \(localDate.first ?? "unknown") to \(localDate.last ?? "unknown")"
    }
}
