//
//  DarkSkyAPIClient.swift
//  niftyFlatironWeather
//
//  Created by Alexey Medvedev on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
  
  class func getDataFromAPI(with completion: @escaping ([String:Any]) -> Void) {
    
    let latitude = 37.785834
    let longitude = -122.406417
    
    // https://api.darksky.net/forecast/[key]/[latitude],[longitude]
    let url = URL(string: "https://api.darksky.net/forecast/\(darkSkySecretKey)/\(latitude),\(longitude)")
    
    print(url)
    
    let session = URLSession.shared
    print("got to sesion")
    if let unwrappedUrl = url {
      print("unwrapped url")
      let dataTask = session.dataTask(with: unwrappedUrl, completionHandler: { (data, response, error) in
        print("got to data task completion")
        if let unwrappedData = data {
          print("unwrapped data")
          do {
            let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String:Any]
            completion(jsonData)
            
          } catch {
            print(error)
          }
        }
        
      })
      dataTask.resume()
    }
    
  }
  
}
