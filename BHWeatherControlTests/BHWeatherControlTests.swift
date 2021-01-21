//
//  BHWeatherControlTests.swift
//  BHWeatherControlTests
//
//  Created by Bassem Hatira on 18/01/2021.
//

import XCTest
@testable import BHWeatherControl

class BHWeatherControlTests: XCTestCase {

    let weatherWorker = WeatherWorker()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCurrentWeather() {
        let expectation = self.expectation(description: "Current Weathers Expectation 200")
        let locations = [Location(lat: "48.8", lon: "2.1833"), Location(lat: "48.8", lon: "2.25")]
        weatherWorker.fetchCurrentWeathers(locations: locations) { (weathers, error) in
            guard let error = error else {
                expectation.fulfill()
                return
            }
            XCTFail("Error: \(error.localizedDescription)")
        }
        waitForExpectations(timeout: 5) { (error) in
        }
    }
    
    func testDetailsWeather() {
        let expectation = self.expectation(description: "Detail Weather Expectation 200")
        let location = Location(lat: "48.8", lon: "2.1833")
        weatherWorker.fetchWeatherDetails(location: location) { (weather) in
            expectation.fulfill()
        } onError: { (error) in
            XCTFail("Error: \(error?.localizedDescription ?? "Error")")
        }
        waitForExpectations(timeout: 5) { (error) in
        }
    }

}
