//
//  DailyTableViewController.swift
//  niftyFlatironWeather
//
//  Created by William Robinson on 10/31/16.
//  Copyright © 2016 Johann Kerr. All rights reserved.
//

import UIKit

class DailyView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myTableView = UITableView()
    let dataStore = DarkSkyDataStore.sharedInstance
    let headerLabel = UILabel()
    let headerView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.view.addSubview(myTableView)
        self.view.addSubview(headerView)
        
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        headerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headerView.backgroundColor = .white
        
        headerView.addSubview(headerLabel)
        headerLabel.textColor = UIColor.black
        headerLabel.textAlignment = .center
        headerLabel.text = "Daily Weather Forecast"
        headerLabel.font = UIFont(name: "Helvetica", size: 20)
        headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -5).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        
        myTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        myTableView.register(CustomDailyCell.self, forCellReuseIdentifier: "dailyCell")
        myTableView.rowHeight = view.bounds.height / 4

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.dailyDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "dailyCell", for: indexPath) as! CustomDailyCell
        
        let date = Date(timeIntervalSince1970: dataStore.dailyDataArray[indexPath.row].time)
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        
        
        cell.summaryLabel.text = dataStore.dailyDataArray[indexPath.row].summary
        cell.iconImageView.image = dataStore.dailyDataArray[indexPath.row].icon
        cell.dayLabel.text = formatter.string(from: date)
        cell.tempLabel.text = dataStore.dailyDataArray[indexPath.row].temperature
        
        return cell
    }
}

class CustomDailyCell: UITableViewCell {
    
    var iconImageView = UIImageView()
    var dayLabel = UILabel()
    var tempLabel = UILabel()
    var summaryLabel = UILabel()
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
        
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(stackView)
        
        self.stackView.addArrangedSubview(dayLabel)
        self.stackView.addArrangedSubview(tempLabel)
        self.stackView.addArrangedSubview(summaryLabel)
        
        tempLabel.font = UIFont(name: "Helvetica", size: 20)
        tempLabel.textColor = .blue

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 5).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        iconImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75).isActive = true
        iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
    }
    
    
}
