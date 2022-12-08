//
//  WeatherCell.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 26.11.2022.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    var conditionIcon = UIImageView()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Cabin-Bold", size: 16)
        label.textColor = .white
        return label
    }()
    
    var tempRate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Cabin-Bold", size: 16)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(conditionIcon)
        addSubview(descriptionLabel)
        addSubview(tempRate)
        
        configureConditionIcon()
        configureDescriptionLabel()
        configureTempRateLabel()
        
        setConditionIconConstraints()
        setDescriptionLabelConstraints()
        setTempRateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
    
    func set(weatherItem: WeatherModel.WeatherItem) {

        conditionIcon.image = weatherItem.condition
        descriptionLabel.text = weatherItem.description
        tempRate.text = "\(weatherItem.tempMinString)º / \(weatherItem.tempMaxString)º"
    }
    
    
    func configureConditionIcon() {
        conditionIcon.clipsToBounds = true
    }
    
    func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureTempRateLabel() {
        tempRate.numberOfLines = 0
        tempRate.adjustsFontSizeToFitWidth = true
    }
    
    
    func setConditionIconConstraints() {
        conditionIcon.translatesAutoresizingMaskIntoConstraints = false
        conditionIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        conditionIcon.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        conditionIcon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        conditionIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: conditionIcon.trailingAnchor, constant: 24).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    func setTempRateConstraints() {
        tempRate.translatesAutoresizingMaskIntoConstraints = false
        tempRate.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        tempRate.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tempRate.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
}


/*extension WeatherCell: WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {

            self.tempRate.text = weather.tempRate
            self.descriptionLabel.text = weather.description
            self.conditionIcon.image = weather.condition
            //print(weather.listItems)

        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
}*/
