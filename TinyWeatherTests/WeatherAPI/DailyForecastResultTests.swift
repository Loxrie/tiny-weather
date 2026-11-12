//
//  Untitled.swift
//  TinyWeather
//
//  Created by Paul Downs on 12/11/2026.
//

import Testing
import Foundation

@testable import TinyWeather

struct DailyForecastResultTests {

    @Test func ensureOptionalAcceptsNull() async throws {
        let data = testSummary.data(using: .utf8)!
        let dailySummaryDictionary = (try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary)!
        
        #expect(throws: Never.self) {
            let result : DailyForecastResult = try DailyForecastResult.parseJSON(dailySummaryDictionary)
            
            #expect(result.gustSpeedMph.first == Double(6))
            #expect(result.gustSpeedMph.last == Double(19))
            #expect(result.pollenIndexText[5] == nil)
        }
    }

}
