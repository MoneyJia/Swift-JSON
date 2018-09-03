//
//  BuildObjectMappleModel.swift
//  Swift-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import ObjectMapper

struct BuildObjectMappleModel : Mappable{

    var build_name : NSString?
    var build_address : NSString?
    var area_address : NSString?
    var area : [Any]? = []
    var detail_address : detail_address?
    var build_num : NSInteger? = 0
    var room_num : NSInteger? = 0

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        build_name <- map["build_name"]
        build_address <- map["build_address"]
        area_address <- map["area_address"]
        area <- map["area"]
        detail_address <- map["detail_address"]
        build_num <- map["build_num"]
        room_num <- map["room_num"]
    }
    
    var description: String {
        get {
            return Mapper().toJSONString(self, prettyPrint: true)!
        }
    }
}

struct detail_address : Mappable {
    
    var province : NSString?
    var city : NSString?
    var district : NSString?
    var street : NSString?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        province <- map["province"]
        city <- map["city"]
        district <- map["district"]
        street <- map["street"]
    }
    
    
}
