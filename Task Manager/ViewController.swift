//
//  ViewController.swift
//  Task Manager
//
//  Created by Vikas R S on 7/29/18.
//  Copyright © 2018 Vikas Radhakrishna Shetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func darkModeClicked(_ sender: Any)
    {
        view.backgroundColor = UIColor.black
        
        // To get all the subviews, this will be a array of UIViews
        let allSubViews = view.subviews
        
        // iterate through the array
        for subView in allSubViews
        {
            // check if individual UIView is of type UILabel
            if subView is UILabel
            {
                // If its a UILabel, the downcast it using as
                let labelSubview = subView as! UILabel
                
                // Now change the c
                labelSubview.textColor = UIColor.white
                
                UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

