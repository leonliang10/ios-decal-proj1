//
//  statViewController.swift
//  MyToDoList
//
//  Created by Leon Liang on 2/29/16.
//  Copyright © 2016 Leon Liang. All rights reserved.
//

import UIKit

class statViewController: UIViewController {
    
    var delegate : ModelDelegate?
    @IBOutlet weak var numberOfTasksCompletedInPast24HoursLabel: UILabel!
    @IBOutlet weak var numberOfTasksCompletedInTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfTasksCompletedInPast24Hours = delegate?.numTaskCompleted()
        numberOfTasksCompletedInPast24HoursLabel.text = "\(numberOfTasksCompletedInPast24Hours!)"
        
        let numberOfTasksCompletedInTotal = delegate?.totalNumberTasksCompleted()
        numberOfTasksCompletedInTotalLabel.text = "Total Number of Tasks Completed: \(numberOfTasksCompletedInTotal!)"
        
    }

}
