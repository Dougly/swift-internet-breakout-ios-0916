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
    
    var time = Double()
 //   var summary: [String]
//    var icon: [UIImage]
//    var temperature: [Double]
//    
    init(with data: [String:Any]) {
        self.time = data["time"] as! Double
        print(self.time)
    }
}

class DailyData {
    var icon = String()
    var summary = String()
    
    init(with data: [String:Any]) {
        self.icon = data["icon"] as! String
        self.summary = data["summary"] as! String
    }
}

class TodayData {
  var summary = String()
  
  init(with data: [String:Any]) {
    self.summary = data["summary"] as! String
  }
  
}



