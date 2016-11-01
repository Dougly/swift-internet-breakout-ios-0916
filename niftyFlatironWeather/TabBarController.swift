//
//  TabBarController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let todayVC = TodayViewController()
    let dailyVC = DailyTableViewController()
    let hourlyVC = HourlyTableViewController()
    
    todayVC.tabBarItem = UITabBarItem(title: "Today", image: #imageLiteral(resourceName: "snore"), selectedImage: nil)
    dailyVC.tabBarItem = UITabBarItem(title: "Daily", image: #imageLiteral(resourceName: "jiggly"), selectedImage: nil)
    hourlyVC.tabBarItem = UITabBarItem(title: "Hourly", image: #imageLiteral(resourceName: "pikachu"), selectedImage: nil)
    
    viewControllers = [todayVC, dailyVC, hourlyVC]
  }
}
