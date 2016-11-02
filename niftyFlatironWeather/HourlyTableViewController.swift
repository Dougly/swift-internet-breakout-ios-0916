//
//  HourlyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/28/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class HourlyView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var hourlyTableView = UITableView()
    var headerView = UIView()
    var headerLabel = UILabel()
    
    let dataStore = DarkSkyDataStore.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hourlyTableView.delegate = self
        hourlyTableView.dataSource = self
        
        self.view.addSubview(hourlyTableView)
        hourlyTableView.register(customHourlyCell.self, forCellReuseIdentifier: "hourly")
        hourlyTableView.rowHeight = view.frame.height / 10
        self.view.addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        hourlyTableView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.backgroundColor = .white
        
        headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5).isActive = true
        headerLabel.text = "Hourly Forecast"
        headerLabel.font = UIFont(name: "Helvetica", size: 20)
        
        hourlyTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        hourlyTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hourlyTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hourlyTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataStore.hourlyDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hourlyTableView.dequeueReusableCell(withIdentifier: "hourly") as! customHourlyCell
        print("creating table view cell content")
        let date = Date(timeIntervalSince1970: dataStore.hourlyDataArray[indexPath.row].time)
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        cell.hourLabel.text = formatter.string(from: date)
        cell.imgView.image = dataStore.hourlyDataArray[indexPath.row].icon
        cell.tempLabel.text = dataStore.hourlyDataArray[indexPath.row].temperature
        
        return cell
    }
    
}


class customHourlyCell: UITableViewCell {
    
    var imgView = UIImageView()
    var hourLabel = UILabel()
    var tempLabel = UILabel()
    var stackView = UIStackView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit() 
    }
    
    func commonInit() {
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(hourLabel)
        stackView.addArrangedSubview(tempLabel)
        tempLabel.font = UIFont(name: "Helvetica", size: 20)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 5).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.distribution = .fillEqually
        
        
    }
    
}

