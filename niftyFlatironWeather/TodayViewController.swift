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
    
    var temperatureLabel = UILabel()
    var summaryLabel = UILabel()
    var iconImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        view.addSubview(summaryLabel)
        view.addSubview(temperatureLabel)
        view.addSubview(iconImageView)

        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        summaryLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        temperatureLabel.heightAnchor.constraint(equalTo: temperatureLabel.heightAnchor, multiplier: 1).isActive = true
        temperatureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        temperatureLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        temperatureLabel.font = UIFont(name: "Helvetica", size: 45)
        temperatureLabel.textAlignment = .center
        

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor, multiplier: 1).isActive = true
        iconImageView.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        
        dataStore.getData {
            DispatchQueue.main.async {
                self.summaryLabel.text = self.dataStore.todayData.summary
                self.temperatureLabel.text = self.dataStore.todayData.temperature
                self.iconImageView.image = self.dataStore.todayData.icon
            }
        }
    }
}


