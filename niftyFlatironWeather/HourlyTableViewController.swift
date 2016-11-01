//
//  HourlyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyTableViewController: UITableViewController {
  
  let dataStore = DarkSkyDataStore.sharedInstance
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "hourly")
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return dataStore.hourlyDataArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "hourly")
    
    let date = Date(timeIntervalSince1970: dataStore.hourlyDataArray[indexPath.row].time)
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    let dateString = formatter.string(from: date)
    
    cell?.textLabel?.text = dateString
    
    return cell!
  }
}
