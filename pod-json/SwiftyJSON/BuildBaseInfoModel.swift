//
//  BuildBaseInfoModel.swift
//  Swift-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import SwiftyJSON

struct BuildBaseInfoModel {
    
    var build_name: String?
    var build_address: String?
    var build_num: String?
    var room_num: String?
    var area_address: String?
    var detail_address: DetailAddressModel
    var area:[Any]?
    // 这里面积area中就不能再用arrayValue获取了，因为arrayValue获取的为JSON类型，我们需要转为我们需要的对象
    init(jsonData: JSON) {
        build_name    = jsonData["build_name"].stringValue
        build_address = jsonData["build_address"].stringValue
        area_address  = jsonData["area_address"].stringValue
        room_num      = jsonData["room_num"].stringValue
        build_num     = jsonData["build_num"].stringValue
        area          = jsonData["area"].arrayObject
        detail_address = DetailAddressModel(jsonData: jsonData["detail_address"])
    }
}
struct DetailAddressModel {
    var province: String?
    var city: String?
    var district: String?
    var street: String?
    
    init(jsonData: JSON) {
        province = jsonData["province"].stringValue
        city = jsonData["city"].stringValue
        district = jsonData["district"].stringValue
        street = jsonData["street"].stringValue
    }
    
}
