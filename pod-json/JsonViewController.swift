//
//  JsonViewController.swift
//  pod-json
//
//  Created by money on 2018/8/31.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "json,dic,arr之间互转";
        
        //http://www.cnblogs.com/jukaiit/p/9345654.html
        
        let dictionary_temp = "{\"name\":80.5,\"id\":80.5,\"num\":180}"
        
        //let dic = getDictionaryFromJSONString(jsonString: m)
        //print(dic)
        
        let dic = getDictionaryFromJSONString(jsonString: dictionary_temp)
        print(dic)
        
        
        let m = "[[\"20.0\",\"28.0\"],[\"29.0\",\"29.0\"],{\"name\":80.5,\"id\":80.5,\"num\":180}]"
        let arr = getArrayFromJSONString(jsonString: m)
        print(arr)
        for item in arr {
            print(item)
            
            if item is Array<Any> {
                
                for someVar2 in item as! Array<Any>
                {
                    print(someVar2)
                }
            }
            
            if item is String {
                let dic = getDictionaryFromJSONString(jsonString: item as! String)
                print(dic)
            }
        }
        
        
        let l = getJSONStringFromArray(array: arr)
        NSLog(l)
        
        //未解决 怎么判断类型为数组
        if m is String {
            print("YES");
        } else {
            print("NO")
        }
        
        if arr is Array<Any> {
            print("YES");
        } else {
            print("NO")
        }
        
        
        let h = "[\"[\"20.8\",\"20.9\",\"21.5\"]\",\"[\"20.8\",\"20.9\",\"21.5\"]\",\"[\"20.8\",\"20.9\",\"21.5\"]\"]"
        
        //下面这么写是出不来的，因为 上面是字符串，一个用[]扩起来的字符串
        let arrh = getArrayFromJSONString(jsonString: h)
        for item in arrh {
            
            if item is String {
                
                let arrItem = getArrayFromJSONString(jsonString: item as! String)
                print(arrItem)
                
            }
            
        }
        
        
        let h2 = "[\"20.8\",\"20.9\",\"21.5\"]\",\"[\"20.8\",\"20.9\",\"21.5\"]\",\"[\"20.8\",\"20.9\",\"21.5\"]"
        let arrh2 = getArrayFromJSONString(jsonString: h2)
        print(arrh2)
        
    }
    
    //1、JSONString转换为字典
    
    // JSONString转换为字典
    
    func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
        
        
    }
    
    
    //2、JSONString转换为数组
    
    func getArrayFromJSONString(jsonString:String) ->NSArray{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let array = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if array != nil {
            return array as! NSArray
        }
        return NSArray()
        
    }
    
    
    //3、字典转换为JSONString
    
    /**
     字典转换为JSONString
     
     - parameter dictionary: 字典参数
     
     - returns: JSONString
     */
    func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
        
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
    
    
    //4、数组转换为JSONString
    
    //数组转json
    func getJSONStringFromArray(array:NSArray) -> String {
        
        if (!JSONSerialization.isValidJSONObject(array)) {
            print("无法解析出JSONString")
            return ""
        }
        
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
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
