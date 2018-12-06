//
//  ViewController.swift
//  sampleProject
//
//  Created by AMAN JAIN on 06/12/18.
//  Copyright © 2018 PayTm. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UIViewController {
    
    var accNo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        readJson()
    }
    
    
    private func readJson() {
        do {
            if let file = Bundle.main.url(forResource: "response", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                     print(object)
                    if let resp =  object["response"] as? [String : Any], let list = resp["beneficiaryList"] as? [[String : Any]], list.count > 0
                   {
                     print(list[1]["accountNo"]!)
                    
                    
                    }
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                    
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }



}

