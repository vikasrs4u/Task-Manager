//
//  Task.swift
//  Task Manager
//
//  Created by Vikas R S on 8/8/18.
//  Copyright © 2018 Vikas Radhakrishna Shetty. All rights reserved.
//

import Foundation

enum TaskType
{
    case daily, weekly, monthly;
}

struct Task
{
    var name:String
    var type:TaskType
    var completed:Bool
}
