//
//  DataStore.swift
//  niftyFlatironWeather
//
//  Created by Alexey Medvedev on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class DarkSkyDataStore {
  // create data singleton
  static let sharedInstance = DarkSkyDataStore()
  private init() {}
  
  var hourlyDataArray = [HourlyData]()
  var dailyDataArray = [DailyData]()
  var todayData: TodayData!
  
  func getData(with completion: @escaping () -> Void) {
    DarkSkyAPIClient.getDataFromAPI { (data) in
      
      let today = data["currently"] as! [String:Any]
      self.todayData = TodayData(with: today)
      
      let hourly = data["hourly"] as! [String:Any]
      let hourlyData = hourly["data"] as! [[String:Any]]
      
      let daily = data["daily"] as! [String:Any]
      let dailyData = daily["data"] as! [[String:Any]]
      
      for i in 0..<hourlyData.count {
        self.hourlyDataArray.append(HourlyData.init(with: hourlyData[i]))
      }
      for i in 0..<dailyData.count {
        self.dailyDataArray.append(DailyData.init(with: dailyData[i]))
      }
      
      
      completion()
    }
    
  }
}
