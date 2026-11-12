//
//  WeatherResult.swift
//  TinyWeather
//
//  Created by Paul Downs on 12/11/2026.
//

import Foundation
import RxSwift

struct WeatherResult: CustomDebugStringConvertible {
    let name: String;
    let isNight: Bool;
    let issueDate: String;
    let lastUpdated: String;
    let summary: DailyForecastResult;
//    let hourly: HourlyDetails;
}

extension WeatherResult {
    var debugDescription: String {
        "Forecast retrieved for \(name), last updated \(lastUpdated)"
    }
}
