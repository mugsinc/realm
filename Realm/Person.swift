//
//  Person.swift
//  Realm
//
//  Created by Mugunthan Balakrishnan on 21/04/15.
//  Copyright (c) 2015 230 Interactive. All rights reserved.
//

import UIKit
import Realm

class Person: RLMObject {
    //dynamic var id = 9
    dynamic var foo = ""
    dynamic var sup = ""
    dynamic var created = NSDate()

    
//    override class func primaryKey() -> String {
//        return "id"
//    }
}