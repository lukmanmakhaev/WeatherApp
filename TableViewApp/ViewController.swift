//
//  ViewController.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 26.11.2022.
//

// Some code for git

import UIKit

class ViewController: UIViewController {
    
    let locationIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "London"
        label.font = UIFont(name: "Cabin-Medium", size: 37)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changeCityButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change your city", for: .normal)
        button.backgroundColor = UIColor.init(hexString: "FFB200")
        button.titleLabel?.font = UIFont(name: "Cabin-Regular", size: 17)
        button.layer.cornerRadius = 21
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "27"
        label.textColor = .white
        label.font = UIFont(name: "Cabin-Bold", size: 161)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let describtionLabel: UILabel = {
        let label = UILabel()
        label.text = "Cloudy"
        label.textColor = .white
        label.font = UIFont(name: "Cabin-Medium", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondButton: UIButton = {
        let button = UIButton()
        button.setTitle("AQI 14", for: .normal)
        button.backgroundColor = UIColor.init(hexString: "FFB200")
        button.titleLabel?.font = UIFont(name: "Cabin-Medium", size: 23)
        button.layer.cornerRadius = 21
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let moreDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "More details >"
        label.textColor = .white
        label.font = UIFont(name: "Cabin-Medium", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = UIColor .clear
        t.translatesAutoresizingMaskIntoConstraints = false
        t.separatorStyle = .none
        return t
        
    }()
    var weathers: [WeatherModel] = []
    
    let forecastsButton: UIButton = {
        let button = UIButton()
        button.setTitle("7-day forecast", for: .normal)
        button.backgroundColor = UIColor.init(hexString: "FFB200")
        button.titleLabel?.font = UIFont(name: "Cabin-Medium", size: 23)
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        weathers = fetchData()
        initView()
                
    }
        
    func initView() {
        
        self.view.addSubview(locationIcon)
        locationIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 46).isActive = true
        locationIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 28).isActive = true
        locationIcon.widthAnchor.constraint(equalToConstant: 28).isActive = true
        
        self.view.addSubview(locationLabel)
        locationLabel.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 5).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(changeCityButton)
        changeCityButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 7).isActive = true
        changeCityButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeCityButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        changeCityButton.widthAnchor.constraint(equalToConstant: 218).isActive = true
        
        self.view.addSubview(tempLabel)
        tempLabel.topAnchor.constraint(equalTo: changeCityButton.bottomAnchor, constant: 45).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 115).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 175).isActive = true
        
        self.view.addSubview(describtionLabel)
        describtionLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 35).isActive = true
        describtionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        describtionLabel.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        self.view.addSubview(secondButton)
        secondButton.topAnchor.constraint(equalTo: describtionLabel.bottomAnchor, constant: 31).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 137).isActive = true
        
        self.view.addSubview(moreDetailsLabel)
        moreDetailsLabel.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 47).isActive = true
        moreDetailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        moreDetailsLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
           
        
        /////////////////////////////
        self.view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height
        tableView.rowHeight = 55
        //register cells
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        //set constraints
        tableView.topAnchor.constraint(equalTo: moreDetailsLabel.topAnchor, constant: 30).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -127).isActive = true
        tableView.isScrollEnabled = false
        /////////////////////////////
        
        
        
        self.view.addSubview(forecastsButton)
        forecastsButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30).isActive = true
        forecastsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        forecastsButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        forecastsButton.widthAnchor.constraint(equalToConstant: 264).isActive = true
        
        
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}
 
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as! WeatherCell
        let weatherModel = weathers[indexPath.row]
        cell.set(weatherModel: weatherModel)
        cell.backgroundColor = UIColor .clear
        cell.selectionStyle = .none

        
        
        return cell
        
    }
   
}

extension ViewController {
    func fetchData() -> [WeatherModel] {
        let weather1 = WeatherModel(conditionId: 804, description: "Overcast",tempMin: 10.22, tempMax: 11.39)
        let weather2 = WeatherModel(conditionId: 500, description: "Light",tempMin: 10.22, tempMax: 11.50)
        let weather3 = WeatherModel(conditionId: 500, description: "Light rain",tempMin: 10.87, tempMax: 10.42)
        
        return [weather1, weather2, weather3]
    }
}
