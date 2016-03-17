//
//  Question.swift
//  SurvataDemo
//
//  Created by Theresa Gao on 3/1/16.
//  Copyright © 2016 InteractiveLabs. All rights reserved.
//

import Foundation
import UIKit

class Question {
    //MARK: Properties
    var name: String
    var percentage: Int
    
    //MARK: Initialization
    init?(name: String, percentage: Int){
        self.name = name
        self.percentage = percentage
        //Initialization should fail if there is no name
        if name.isEmpty {
            return nil
        }
        if percentage >= 100 || percentage <= 0 {
            return nil
        }
    }
    

}
