//
//  ViewController.swift
//  TweetDemo
//
//  Created by asmita.borawake on 26/07/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tweet : Tweet?
    
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var salaryLbl: UILabel!
    @IBOutlet weak var genderSeg: UISegmentedControl!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayPicker.maximumDate = Date()
        
        //dismiss keyboard when click view
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector.endEditing))
        
    }

 
    @IBAction func sliderClick(_ sender: UISlider) {
        
        salaryLbl.text = "Rs\((Int)(sender.value))K"
        
    }
    
    
    
    @IBAction func tweet_click(_ sender: Any) {
        
    func getLableInfo() -> (name: String?, work:String?, salary:String?){
            guard let name = nameTextField.text,
            let work = workTextField.text ,
            let salary = salaryLbl.text
                else {
                    return(nil,nil,nil)
            }
            if name.isEmpty || work.isEmpty || salary.isEmpty {
                return(nil,nil,nil)
            }
            return(name, work, salary)
        }
        
    func getAge() -> Int? {

        let ageComponant = Calendar.current.dateComponents([.year], from: birthdayPicker.date,to: Date())
            return ageComponant.year
            
        }
        
        
    let lblInfo = getLableInfo()
       
     if let name = lblInfo.name , let work = lblInfo.work , let salary = lblInfo.salary, let age = getAge(){
            tweet = Tweet(gender: Gender(rawValue: genderSeg.selectedSegmentIndex)!, name: name, age: age, work: work, salary: salary)
        }else {
            tweet = nil
        }
        
        switch tweet {
        case .some(let tweet):
           showMessage(title: "My Tweet", message: tweet.info, buttonTitle: "OK")
        case .none:
            showMessage(title: "Info miss", message: "Please fill out correct info", buttonTitle: "OK")
            
        }
        
    }
    
   
   


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
