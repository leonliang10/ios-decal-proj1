//
//  ToDoListModel.swift
//  MyToDoList
//
//  Created by Leon Liang on 2/29/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

import UIKit

class ToDoListModel: NSObject {
    
    var toDoListItems : [String]!
    var timerForTask : [String : NSDate?]!
    var checkedTasks : [String]!
    var tasksAfter24Hours : [String]!
    
    var timeOfTaskCompletion : NSDate?
    var currentTime : NSDate?
    var startTime : NSDate?
    var task : String!
    var indexToBeRemoved : Int!
    let oneWholeDay = 60 * 60 * 24 * 1.0
    
    
    override init() {
        toDoListItems = [String]()
        checkedTasks = [String]()
        tasksAfter24Hours = [String]()
        timerForTask = [String : NSDate?]()
    }
    
    func addTask(taskDescription : String) {
        if !containsTask(taskDescription) {
            toDoListItems.append(taskDescription)
        }
    }
    
    func removeTask(index : Int) {
        toDoListItems.removeAtIndex(index)
    }
    
    func getTask(index : Int) -> String! {
        return toDoListItems[index]
    }
    
    func getCheckedTask(index : Int) -> String! {
        return checkedTasks[index]
    }
    
    func numberOfTasks() -> Int {
        return toDoListItems.count
    }
    
    func numberOfTasksChecked() -> Int {
        return checkedTasks.count
    }
    
    func totalNumberOfTasksCompleted() -> Int {
        return checkedTasks.count + tasksAfter24Hours.count
    }
    
    func containsTask(taskDescription : String) -> Bool {
        return toDoListItems.contains(taskDescription)
    }
    
    func isTaskChecked(taskDescription : String) -> Bool {
        return checkedTasks.contains(taskDescription)
    }
    
    func markTaskAsChecked(index : Int) {
        timeOfTaskCompletion = NSDate()
        task = toDoListItems[index]
        timerForTask[task] = timeOfTaskCompletion
        checkedTasks.append(task)
    }
    
    func markTaskAsUnchecked(index : Int) {
        task = toDoListItems[index]
        indexToBeRemoved = checkedTasks.indexOf(task)
        checkedTasks.removeAtIndex(indexToBeRemoved)
        timerForTask.removeValueForKey(task)
    }
    
    func hasTaskCompletedFor24Hours(taskDescription : String) -> Bool {
        currentTime = NSDate()
        startTime = timerForTask[taskDescription]! as NSDate?
        if (currentTime!.timeIntervalSinceDate(startTime!) >= oneWholeDay) {
            return true
        } else {
            return false
        }
    }
    
    func removeCompletedTaskAfter24Hours(taskDecription : String) {
        task = taskDecription
        indexToBeRemoved = toDoListItems.indexOf(task)
        toDoListItems.removeAtIndex(indexToBeRemoved)
        timerForTask.removeValueForKey(task)
        tasksAfter24Hours.append(task)
        indexToBeRemoved = checkedTasks.indexOf(task)
        checkedTasks.removeAtIndex(indexToBeRemoved)
        
    }
}
