//
//  SwiftyJSONController.swift
//  pod-json
//
//  Created by money on 2018/8/28.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit
import SwiftyJSON

class SwiftyJSONController: UIViewController {

    var json: JSON = JSON.null
    var listArr : [ViewModel]?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let file = Bundle.main.path(forResource: "SwiftyJSONTests", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: file))
                json = try JSON(data: data)
            } catch {
                json = JSON.null
            }
        } else {
            json = JSON.null
        }
        
        self.title = "SwiftyJSON";
        
        //Json转模型1--SwiftyJson   (https://www.jianshu.com/p/46f55c2d219c)
        // 在这里需要注意的是：此时的index应该是 0..<json.count的字符串
        for (index, subJSON) : (String, JSON) in json {
            print("index : \(index)   subJSON-Type : \(subJSON.type)")
            
            let model = ViewModel.init(jsonData: subJSON)
            listArr?.append(model)
            
        }
        
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
        
        
        let jsonData = JSON(baseInfo)
        let model = BuildBaseInfoModel.init(jsonData: jsonData)
        // 会得到创建好的 BuildBaseInfoModel类型的 对象model
        // 也可以这样写
        let model2 = BuildBaseInfoModel(jsonData: jsonData)
        
        print(model.detail_address.city as Any)
        print(model.area?.first as Any)
        print(model.area?[1] as Any)
        
        print(model2.detail_address.city as Any)
        print(model2.area?.first as Any)
        print(model2.area?[1] as Any)
        
        
        let aModel = AModel()
        aModel.name = "呵呵"
        aModel.user = AModel.User()
        aModel.user?.bb = "得到"
        
        print("bb is %@",aModel.user?.bb as Any)
        
        
        
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
