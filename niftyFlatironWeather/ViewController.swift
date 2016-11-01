//
//  ViewController.swift
//  niftyFlatironWeather
//
//  Created by Johann Kerr on 10/27/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let locationManager = CLLocationManager()
    var latitude = Double()
    var longitude = Double()
   
    @IBOutlet weak var hourlyTableView: UITableView!
    
    let dataStore = DarkSkyDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        hourlyTableView.delegate = self
        hourlyTableView.dataSource = self
        dataStore.getData {
            DispatchQueue.main.async {
                self.hourlyTableView.reloadData()
                print("THIS IS THE COUNT FOR HOURLY TIMES:\(self.dataStore.hourlyDataArray.count)")
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.hourlyDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourly")
        
        cell?.textLabel?.text = String(dataStore.hourlyDataArray[indexPath.row].time)
        
        return cell!
    }
    

}


extension ViewController: CLLocationManagerDelegate{
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        if let unwrappedlatitude = locationManager.location?.coordinate.latitude, let unwrappedLongitude = locationManager.location?.coordinate.longitude{
            self.latitude = unwrappedlatitude
            self.longitude = unwrappedLongitude
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

