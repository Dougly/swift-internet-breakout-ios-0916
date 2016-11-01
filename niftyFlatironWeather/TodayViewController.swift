//
//  TodayViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
  var dataStore = DarkSkyDataStore.sharedInstance
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let todaySummary = UILabel()
    view.addSubview(todaySummary)
    todaySummary.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    todaySummary.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    todaySummary.translatesAutoresizingMaskIntoConstraints = false
    
    view.backgroundColor = UIColor.brown
    dataStore.getData { 
      DispatchQueue.main.async {
        todaySummary.text = self.dataStore.todayData.summary
      }
    }
    
  }
}
