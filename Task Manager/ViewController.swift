//
//  ViewController.swift
//  Task Manager
//
//  Created by Vikas R S on 7/29/18.
//  Copyright © 2018 Vikas Radhakrishna Shetty. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    let dailyTask = ["Do atleast one leetcode problem.",
                     "Learn Data Structures.",
                     "Learn Swift new features."]
    let weeklyTask = ["Revise all the leetcode problems solved.",
                     "Revice Data Structures.",
                     "Work on your new iOS App Idea."]
    
    let monthlyTask = ["Call your atleast one of your close friend.",
                       "Call a close relative.",
                       "Visit a new place."]
    
    
    // Below is the table view delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
            print ("Your selected row is \(indexPath.row) and its section is \(indexPath.section)")
    }
    
    // Below are the table view data source methods
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section
        {
        case 0:
            return dailyTask.count
        case 1:
            return weeklyTask.count
        case 2:
            return monthlyTask.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        switch indexPath.section
        {
        case 0:
            cell.textLabel?.text = dailyTask[indexPath.row]
        case 1:
            cell.textLabel?.text = weeklyTask[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTask[indexPath.row]
        default:
            print("This will never happen")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        switch section
        {
        case 0:
            return "Daily Task"
        case 1:
            return "Weekly Task"
        case 2:
            return "Monthly Task"
        default:
            return nil
        }
    }

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

