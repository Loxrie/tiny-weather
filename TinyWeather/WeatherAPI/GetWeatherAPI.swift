//
//  GetWeather.swift
//  TinyWeather
//
//  Created by Paul Downs on 11/11/2026.
//

import Foundation
import RxSwift

func apiError(_ error: String) -> NSError {
    NSError(domain: "GetWEatherAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: error])
}

public let WeatherParseError = apiError("Error during parsing")

protocol WeatherAPI {
    func getWeatherForLocation(_ query: String) -> Observable<WeatherResult>
}

class GetWeatherAPI {
    private let _reachabilityService: ReachabilityService

    private init(reachabilityService: ReachabilityService) {
        _reachabilityService = reachabilityService
    }
}

extension GetWeatherAPI {
    func loadWeatherURL() {
        
    }
}
