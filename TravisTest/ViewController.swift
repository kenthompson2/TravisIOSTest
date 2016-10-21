//
//  ViewController.swift
//  TravisTest
//
//  Created by Mark Fraser on 10/14/16.
//  Copyright © 2016 Pokervane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dynamicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var labelText = "Hello"
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        labelText = dict!.object(forKey: "Label Text") as! String
        self.dynamicLabel.text = labelText
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

