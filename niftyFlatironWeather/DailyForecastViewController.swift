//
//  DailyForecastViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation

class DailyForecastViewController: UIViewController, CLLocationManagerDelegate {
  
  // MARK: Properties
  let locationManager = CLLocationManager()
  var latitude = Double()
  var longitude = Double()
  var dailyData = [String : String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupLocationManager()
  }
  
  func setupLocationManager(){
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
    
    if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
      self.latitude = unwrappedlatitude
      self.longitude = unwrappedLongitude
      
      self.getDailyForecast()
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {}
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { print(error) }
  
  func getDailyForecast() {
    
    print("daily forecast")
    
    let urlString = "https://api.darksky.net/forecast/540777e7543f550eaa856e5aa6f3852f/\(String(latitude)),\(String(longitude))"
    
    print(urlString)
    
    let url = URL(string: urlString)
    
    let session = URLSession.shared
    if let unwrappedURL = url {
      
      print("unwrapped")
      
      let dataTask = session.dataTask(with: unwrappedURL, completionHandler: { (data, response, error) in
        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode == 200 {
          if let unwrappedData = data {
            do {
              let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options:[]) as! [String : AnyObject]
              
              let dailyDataResponse = responseJSON["daily"] as! [String : AnyObject]
              
              if let summary = dailyDataResponse["summary"] as? String {
                self.dailyData["summary"] = summary
                print(summary)
              }
              
              if let icon = dailyDataResponse["icon"] as? String {
                self.dailyData["icon"] = icon
                print(icon)
              }
              
              
            } catch { print("Error") }
          }
        }
      })
      
      dataTask.resume()
    }
  }
}
