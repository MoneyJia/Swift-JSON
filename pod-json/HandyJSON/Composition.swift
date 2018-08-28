//
//  Composition.swift
//  pod-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import HandyJSON

struct Composition: HandyJSON {
    var aInt: Int?
    var comp1: Component?
    var comp2: Component?
}

struct Component: HandyJSON {
    var aInt: Int?
    var aString: String?
}
