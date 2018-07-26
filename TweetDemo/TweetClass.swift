//
//  TweetClass.swift
//  TweetDemo
//
//  Created by asmita.borawake on 26/07/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation

struct Tweet {
    var gender : Gender
    var name : String
    var age : Int
    var work :String
    var salary : String
    
    
    var info : String {
        return "Hi, I am \(name). As a \(age) years old \(work) earning \(salary) /year"
    }
}
