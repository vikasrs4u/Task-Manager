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
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    
    
    var dailyTask = [Task(name:"Do atleast one leetcode problem.", type:.daily, completed: false),
                    Task(name:"Learn Data Structures.", type:.daily, completed: false),
                    Task(name:"Learn Swift new features.", type:.daily, completed: false)]

    var weeklyTask = [Task(name:"Revise all the leetcode problems solved.", type:.daily, completed: false),
                      Task(name:"Revice Data Structures.", type:.daily, completed: false),
                      Task(name:"Work on your new iOS App Idea.", type:.daily, completed: false)]

    var monthlyTask = [Task(name:"Call your atleast one of your close friend.", type:.daily, completed: false),
                       Task(name:"Call a close relative.", type:.daily, completed: false),
                       Task(name:"Visit a new place.", type:.daily, completed: false)]
    
    
//    // Below is the table view delegate methods

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//            print ("Your selected row is \(indexPath.row) and its section is \(indexPath.section )")
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completedAction = UIContextualAction(style: .normal, title: "Completed") { (action:UIContextualAction, sourceView:UIView, actionPerformed:(Bool)->Void) in
            
            switch indexPath.section
            {
            case 0:
                self.dailyTask[indexPath.row].completed = true
            case 1:
                self.weeklyTask[indexPath.row].completed = true
            case 2:
                self.monthlyTask[indexPath.row].completed = true
            default:
                print("Do nothing")
            }
            
            tableView.reloadData()
            actionPerformed(true)
        }
        completedAction.backgroundColor = #colorLiteral(red: 0.3254901961, green: 0.9058823529, blue: 0, alpha: 1)
        return UISwipeActionsConfiguration(actions: [completedAction])
    }
    
    // Below are the table view data source methods
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        tableView.backgroundColor = UIColor.clear
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
        var currentTask:Task!
        switch indexPath.section
        {
        case 0:
            currentTask = dailyTask[indexPath.row]
        case 1:
            currentTask = weeklyTask[indexPath.row]
        case 2:
            currentTask = monthlyTask[indexPath.row]
        default:
            print("This will never happen")
        }
        
        cell.textLabel?.text = currentTask.name
        
        if (darkModeSwitchOutlet.isOn)
        {
            if(currentTask.completed)
            {
              cell.textLabel?.textColor = UIColor.lightGray
              cell.accessoryType = .checkmark
            }
            else
            {
               cell.textLabel?.textColor = UIColor.white
               cell.accessoryType = .none
            }
            
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.blue
            cell.selectedBackgroundView = bgColorView
        }
        else
        {
            if(currentTask.completed)
            {
                cell.textLabel?.textColor = UIColor.lightGray
                cell.accessoryType = .checkmark
            }
            else
            {
                cell.textLabel?.textColor = UIColor.black
                cell.accessoryType = .none
            }
            
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize:16)
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.cyan
            cell.selectedBackgroundView = bgColorView
        }
       
        cell.backgroundColor = UIColor.clear

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

    // action called when we click on dark mode switch
    @IBAction func darkModeSwitch(_ sender: UISwitch)
    {
        if(sender.isOn)
        {
            view.backgroundColor = UIColor.black

             UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        // This is very important as this calls the  table view delegate methods on relaod.
            taskTableView.reloadData()
            
            
        }
        else
        {
            view.backgroundColor = UIColor.white
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
            
            // This is very important as this calls the  table view delegate methods on relaod.
            taskTableView.reloadData()
        }
    }
    
    // Code to change the table view header font color and font size
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        
        if(darkModeSwitchOutlet.isOn)
        {
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            header?.textLabel?.textColor = UIColor.white
        }
        else
        {
            let header = view as? UITableViewHeaderFooterView
            header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            header?.textLabel?.textColor = UIColor.black
        }

    }
    
  // Code to reload the task manager list
    @IBAction func resetList(_ sender: Any)
    {
        for i in 0..<dailyTask.count
        {
            dailyTask[i].completed = false
        }
        
        for i in 0..<weeklyTask.count
        {
            weeklyTask[i].completed = false
        }
        
        for i in 0..<monthlyTask.count
        {
           monthlyTask[i].completed = false
        }
        
        taskTableView.reloadData()
        
    }
    
    

}

