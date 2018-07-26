//
//  HelperClass.swift
//  TweetDemo
//
//  Created by asmita.borawake on 26/07/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import UIKit


enum Gender: Int{
    case Male = 0 , Female
}

extension Selector{
    static let endEditing = #selector(UIView.endEditing(_:))
}


extension UIViewController {
    func showMessage(title : String , message : String, buttonTitle:String ){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        present(alert , animated: true , completion: nil)
    }
}
