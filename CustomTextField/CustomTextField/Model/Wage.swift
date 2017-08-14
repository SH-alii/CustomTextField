//
//  Wage.swift
//  CustomTextField
//
//  Created by Alii Shareef on 8/13/17.
//  Copyright © 2017 Alii Shareef. All rights reserved.
//

import Foundation


class Wage {
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
    
    
}
