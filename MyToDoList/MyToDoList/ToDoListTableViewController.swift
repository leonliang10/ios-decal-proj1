//
//  ViewController.swift
//  MyToDoList
//
//  Created by Leon Liang on 2/29/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

import UIKit

protocol ModelDelegate {
    func updateModel(str : String?)
    func numTaskCompleted() -> Int
    func totalNumberTasksCompleted() -> Int
    func doesTaskAlreadyExist(taskDescription : String?) -> Bool
}

class ToDoListTableViewController: UITableViewController, ModelDelegate {
    
    // Model
    // let model = ["test1", "test2", "test3"]
    var listModel : ToDoListModel!
    var task : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listModel = ToDoListModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unWindToToDoListTableViewController(segue : UIStoryboardSegue) {
        updateTaskModelAfter24Hours()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
        task = listModel.getTask(indexPath.row)
        cell.toDoItemTextLabel.text = task
        if (listModel.isTaskChecked(task)) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel.numberOfTasks()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoListTableViewCell
            cell.toDoItemTextLabel.text = ""
            cell.accessoryType = UITableViewCellAccessoryType.None
            listModel.removeTask(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        task = listModel.getTask(indexPath.row)
        if (!listModel.isTaskChecked(task)) {
            listModel.markTaskAsChecked(indexPath.row)
        } else {
            listModel.markTaskAsUnchecked(indexPath.row)
        }
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "addTaskSegue") {
            let nav = segue.destinationViewController as! UINavigationController
            let vc = nav.viewControllers.first as! AddToDoItemViewController
            vc.delegate = self
        }
        if (segue.identifier == "statSegue") {
            let nav = segue.destinationViewController as! UINavigationController
            let vc = nav.viewControllers.first as! statViewController
            vc.delegate = self
        }
    }
    
    func updateModel(str: String?) {
        if let taskDescription = str {
            listModel.addTask(taskDescription)
        }
        self.tableView.reloadData()
    }
    
    func updateTaskModelAfter24Hours() {
        var index = 0
        while (index < listModel.numberOfTasksChecked()) {
            task = listModel.getCheckedTask(index)
            if (listModel.hasTaskCompletedFor24Hours(task)) {
                listModel.removeCompletedTaskAfter24Hours(task)
                tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: index, inSection: 0)], withRowAnimation: .Fade)
                index -= 1
            }
            index += 1
        }
    }
    
    func numTaskCompleted() -> Int {
        return listModel.numberOfTasksChecked()
    }
    
    func totalNumberTasksCompleted() -> Int {
        return listModel.totalNumberOfTasksCompleted()
    }
    
    func doesTaskAlreadyExist(taskDescription : String?) -> Bool {
        return listModel.containsTask(taskDescription!)
    }
    
}

