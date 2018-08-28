//
//  model.swift
//  pod-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Model {
    
    var name: NSString?
    var title: NSString?
    var time: NSString?
    
    init(jsonData:JSON) {
        
        name = jsonData["name"].stringValue as NSString
        title = jsonData["title"].stringValue as NSString
        time = jsonData["time"].stringValue as NSString
    }
}
