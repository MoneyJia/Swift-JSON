//
//  Response.swift
//  pod-json
//
//  Created by money on 2018/8/22.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import HandyJSON

class Response: HandyJSON {
    
    var code: NSInteger? = 0
    
    var msg: NSString?
    
    var data: NSString?
    
    required init() { }
}

struct Mounth {
    var cat: Cat
}

struct Cat {

    var id: Int64!
    var name: String!
    var friend: [String]?
    var weight: Double?
    var alive: Bool = true
    var color: NSString?
}
