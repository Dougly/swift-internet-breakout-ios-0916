//
//  DailyViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController {
  
  let dataStore = DarkSkyDataStore.sharedInstance
  let summaryLabel = UILabel()
  let iconImageView = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataStore.getData { 
      DispatchQueue.main.async {
        self.view.layoutIfNeeded()
      }
    }
    
    view.backgroundColor = UIColor.cyan
    summaryLabel.text = dataStore.dailyDataArray[0].summary
    
    switch dataStore.dailyDataArray[0].icon {
    case "rainy":
      iconImageView.image = #imageLiteral(resourceName: "storm")
    default:
      iconImageView.image = #imageLiteral(resourceName: "sun")
    }
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
