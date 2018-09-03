//
//  ViewController.swift
//  pod-json
//
//  Created by money on 2018/8/21.
//  Copyright © 2018年 money. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let button1 = UIButton(frame: CGRect(x: 100, y: 150, width: 200, height: 50))
        button1 .setTitle("SwiftyJSON", for: UIControlState.normal)
        button1.setTitleColor(UIColor.white, for: UIControlState.normal)
        button1.backgroundColor = UIColor.red
        button1 .addTarget(self, action: #selector(SwiftyJSON), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 250, width: 200, height: 50))
        button2 .setTitle("ObjectMapper", for: UIControlState.normal)
        button2.setTitleColor(UIColor.white, for: UIControlState.normal)
        button2.backgroundColor = UIColor.red
        button2 .addTarget(self, action: #selector(ObjectMapper), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button2)
        
        let button3 = UIButton(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
        button3 .setTitle("HandyJSON", for: UIControlState.normal)
        button3.setTitleColor(UIColor.white, for: UIControlState.normal)
        button3.backgroundColor = UIColor.red
        button3 .addTarget(self, action: #selector(HandyJSON), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button3)
        
        
        let button4 = UIButton(frame: CGRect(x: 100, y: 450, width: 200, height: 50))
        button4 .setTitle("json,dic,arr之间互转", for: UIControlState.normal)
        button4.setTitleColor(UIColor.white, for: UIControlState.normal)
        button4.backgroundColor = UIColor.red
        button4 .addTarget(self, action: #selector(JSONWithArray), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button4)
    }
    
    @objc func SwiftyJSON() {
        self.navigationController?.pushViewController(SwiftyJSONController(), animated: true)
    }
    
    @objc func ObjectMapper() {
        self.navigationController?.pushViewController(ObjectMapperController(), animated: true)
    }

    @objc func HandyJSON() {
        self.navigationController?.pushViewController(HandyJSONController(), animated: true)
    }
    
    @objc func JSONWithArray() {
        self.navigationController?.pushViewController(JsonViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

