//
//  ViewController.swift
//  MySettings
//
//  Created by user179545 on 10/25/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtColor: UITextField!
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
        defaults.set(self.txtUser.text, forKey: "username")
        defaults.set(self.txtPassword.text, forKey: "password")
        defaults.set(self.txtColor.text, forKey: "color")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let newDate = dateFormatter.string(from:datepicker.date)
        defaults.set(newDate, forKey: "bdate")
        print(datepicker.date.description)
        defaults.synchronize()
        clear()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
        if defaults.string(forKey: "username") != nil{
            txtUser.text = defaults.string(forKey: "username")
        }
        if defaults.string(forKey: "password") != nil{
            txtPassword.text = defaults.string(forKey: "password")
        }
        if defaults.string(forKey: "color") != nil{
            txtColor.text = defaults.string(forKey: "color")
        }
        if defaults.string(forKey: "bdate") != nil{
            let bdate = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            let date = dateFormatter.date(from: bdate!)
            datepicker.setDate(date!, animated: true)
        }
        
    }
func clear()
{
    txtUser.resignFirstResponder()
    txtPassword.resignFirstResponder()
    txtColor.resignFirstResponder()
}


}

