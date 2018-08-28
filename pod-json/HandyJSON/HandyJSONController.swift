//
//  HandyJSONController.swift
//  pod-json
//
//  Created by money on 2018/8/28.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import HandyJSON

class HandyJSONController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let json = ["name":"hehe",
                    "title":"test",
                    "time":"hhh"]
        
        let jsonData = JSON(json)
        
        let m = model.init(jsonData: jsonData)
        
        print(m.name as Any)
        
        //Json转模型3--HandyJSON
        let jsonString = "{\"name\":\"cat\",\"id\":\"12345\",\"num\":180}"
        if let animal = JSONDeserializer<Animal>.deserializeFrom(json: jsonString) {
            print(animal.name as Any)
            print(animal.id as Any)
            print(animal.num as Any)
        }
        
        //2.负责
        let jsonString2 = "{\"id\":1234567,\"name\":\"Kitty\",\"friend\":[\"Tom\",\"Jack\",\"Lily\",\"Black\"],\"weight\":15.34,\"alive\":false,\"color\":\"white\"}"
        
        //        if let cat = JSONDeserializer<Cat>.deserializeFrom(json: jsonString2) {
        //            print(cat.id,cat.friend as Any)
        //        }
        
        
        //3.嵌套
        let jsonString3 = "{\"num\":12345,\"comp1\":{\"aInt\":1,\"aString\":\"aaaaa\"},\"comp2\":{\"aInt\":2,\"aString\":\"bbbbb\"}}"
        
        if let composition = JSONDeserializer<Composition>.deserializeFrom(json: jsonString3) {
            print(composition.comp1?.aString as Any,composition.comp2?.aInt as Any)
        }
        
        
        //4.自定义解析方式
        let jsonString4 = "{\"cat_id\":12345,\"name\":\"Kitty\",\"parent\":\"Tom/Lily/Bob\"}"
        let dog = JSONDeserializer<Dog>.deserializeFrom(json: jsonString4)
        print(dog?.id as Any,dog?.name as Any,dog?.parent as Any)
        
        //5.指定反序列化JSON中某个节点
        // 服务端返回了这个JSON，我们想解析的只有data里的cat
        let jsonString5 = "{\"code\":200,\"msg\":\"success\",\"data\":{\"cat\":{\"id\":1234567,\"name\":\"Kitty\",\"friend\":[\"Tom\",\"Jack\",\"Lily\",\"Black\"],\"weight\":15.34,\"alive\":false,\"color\":\"white\"}}}"
        
        // 那么，我们指定解析 "data.cat"，通过点来表达路径
        //        let cat = JSONDeserializer<Cat>.deserializeFrom(json: jsonString5, designatedPath: "data.cat")
        //        if cat != nil {
        //            print(cat?.name as Any,cat?.friend as Any)
        //        }
        
        //6 model -> json
        //        let jsonString6 = dog?.toJSONString()
        //        print(jsonString6 as Any)
        //        let jsonString5Dic = cat?.toJSON()
        //        print(jsonString5Dic as Any)
        //
        let response = JSONDeserializer<Response>.deserializeFrom(json: jsonString5)
        if response != nil {
            print("code \(response?.code as Any),msg \(response?.msg as Any).data \(response?.data as Any)")
            let responseDic = response?.toJSON()
            let data = responseDic!["data"]
            print(data as Any)
        }
        
        //7. json -> dic
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
