//
//  Dog.swift
//  pod-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import HandyJSON

class Dog: HandyJSON {
    
    var id: Int64!
    var name: String!
    var parent: [String]? = []
    required init() {}

    func mapping(mapper: HelpingMapper) {
        // 指定 id 字段用 "cat_id" 去解析
        mapper.specify(property: &id, name: "cat_id")
        
        // 指定 parent 字段用这个方法去解析
        mapper.specify(property: &parent) { (rawString) -> [String] in
            let parentNames = rawString.characters.split{$0 == "/"}.map(String.init)
            return parentNames
        }
    }
}
