//
//  HourlyForecastResultTests.swift
//  TinyWeather
//
//  Created by Paul Downs on 13/11/2026.
//

import Testing
import Foundation

@testable import TinyWeather

struct HourlyForecastResultTests {

    @Test func ensureOptionalAcceptsNull() async throws {
        let data = testHourly.data(using: .utf8)!
        let hourlySummaryDictionary = (try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary)!
        
        #expect(throws: Never.self) {
            let result : HourlyForecastResult = try HourlyForecastResult.parseJSON(hourlySummaryDictionary)
            
            #expect(result.gustSpeedMph.first == Double(6))
            #expect(result.gustSpeedMph.last == Double(15))
            #expect(result.precipitationProbabilityInPercent.last == Double(22))
        }
    }
}
