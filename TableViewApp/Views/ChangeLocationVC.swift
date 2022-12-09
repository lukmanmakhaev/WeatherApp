//
//  ChangeLocationVC.swift
//  TableViewApp
//
//  Created by Lukman Makhaev on 30.11.2022.
//

import UIKit

protocol ChangeLocationVCDelegate {
    func changeCity(city: String)
}

class ChangeLocationVC: UIViewController {
    //var viewController = ViewController()
    var delegate: ChangeLocationVCDelegate?

    let label: UILabel = {
        let label = UILabel()
        label.text = "Type your location📍"
        label.font = UIFont(name: "Cabin-Medium", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter text here"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    var city: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.delegate = self
        //viewController.delegate = self
        initView()
    }
  
    func initView() {
        
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 50).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -26).isActive = true
    }
    
}

extension ChangeLocationVC: UITextFieldDelegate {
    
    func searchPressed(_ sender: UIButton) {
        textField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
     
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Write something"
            return false
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        //self.city = textField.text
        self.delegate?.changeCity(city: textField.text!)
        textField.text = ""
        self.dismiss(animated: true)
    }
    
}

