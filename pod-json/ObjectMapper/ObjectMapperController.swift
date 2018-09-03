//
//  ObjectMapperController.swift
//  pod-json
//
//  Created by money on 2018/8/28.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import ObjectMapper

class ObjectMapperController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "ObjectMapper";
        
        
        //2.Json转模型2--objectMapple
        
        // 面积中89是Int， 109和129是String
        let baseInfo: [String : Any] = ["build_name":"置信·原墅",
                                        "build_address":"学院中路与金桥路交汇处东北侧",
                                        "area_address":"浙江省温州市鹿城区五马街道",
                                        "area":[89,"109","129"],
                                        "detail_address":["province":"浙江省",
                                                          "city":"温州市",
                                                          "district":"鹿城区",
                                                          "street":"五马街道"],
                                        "build_num": 12,
                                        "room_num": 588]
        
        
        // 这样就得到了模型
        let basedata: BuildObjectMappleModel = Mapper<BuildObjectMappleModel>().map(JSONObject: baseInfo)!
        // 打印出来看看
        print(basedata.build_name as Any)
        print(basedata.detail_address?.province as Any)
        /*
         {
         "build_name" : "置信·原墅",
         "build_address" : "学院中路与金桥路交汇处东北侧",
         "detail_address" : {
         "city" : "温州市",
         "province" : "浙江省"
         },
         "build_num" : 12
         }
         */
        
        
        let m = Mapper<BuildObjectMappleModel>().map(JSON: baseInfo)
        print(m?.build_name as Any)
        print(m?.detail_address?.province as Any)
        
        
        let m2 = BuildObjectMappleModel(JSON: baseInfo)
        print(m2?.build_name as Any)
        print(m2?.detail_address?.province as Any)
        
        
        
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
