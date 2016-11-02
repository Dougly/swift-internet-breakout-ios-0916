//
//  HourlyData.swift
//  niftyFlatironWeather
//
//  Created by Alexey Medvedev on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class HourlyData {
    
    let time: Double
    let summary: String
    let icon: UIImage
    let temperature: String
    
    init(with data: [String:Any]) {
        self.time = data["time"] as! Double
        self.summary = data["summary"] as! String
        self.temperature = "\(data["temperature"] as! Int)ºF"
        if data["icon"] as! String == "rain" {
            self.icon = #imageLiteral(resourceName: "storm")
        } else {
            self.icon = #imageLiteral(resourceName: "sun")
        }
    }
}

class DailyData {
    var icon: UIImage
    var summary: String
    let time: Double
    let temperature: String
    
    init(with data: [String:Any]) {
        self.temperature = "\(data["temperatureMax"] as! Int)ºF"
        self.summary = data["summary"] as! String
        self.time = data["time"] as! Double
        if data["icon"] as! String == "rain" {
            self.icon = #imageLiteral(resourceName: "storm")
        } else {
            self.icon = #imageLiteral(resourceName: "sun")
        }
    }
}

class TodayData {
    let summary: String
    let temperature: String
    let icon: UIImage
    
    init(with data: [String:Any]) {
        self.summary = data["summary"] as! String
        self.temperature = "\(data["temperature"] as! Int)ºF"
        if data["icon"] as! String == "rain" {
            self.icon = #imageLiteral(resourceName: "storm")
        } else {
            self.icon = #imageLiteral(resourceName: "sun")
        }
    }
}



