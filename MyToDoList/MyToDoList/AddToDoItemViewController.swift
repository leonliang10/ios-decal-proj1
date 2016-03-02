//
//  AddToDoItemViewController.swift
//  MyToDoList
//
//  Created by Leon Liang on 2/29/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    @IBOutlet weak var inputTask: UITextField!
    @IBOutlet weak var addTaskStatusLabel: UILabel!
    var taskExistsBoolean : Bool?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var delegate : ModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTaskStatusLabel.text = "Enter a new task below"
        taskExistsBoolean = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != self.saveButton {
            return
        }
        if let taskDescription = inputTask.text {
            if (taskDescription != "") {
                delegate?.updateModel(taskDescription)
            }
        }
        return
    }
    
    @IBAction func pressAddTask(sender: AnyObject) {
        if let taskDescription = inputTask.text {
            if (taskDescription != "") {
                taskExistsBoolean = delegate?.doesTaskAlreadyExist(taskDescription)
                if (taskExistsBoolean!) {
                    addTaskStatusLabel.text = "Task already exists! Please complete it first."
                    inputTask.text = ""
                } else {
                    addTaskStatusLabel.text = "Saved task: " + taskDescription
                    delegate?.updateModel(taskDescription)
                    inputTask.text = ""
                }
            }
        }
    }
    
    
}
