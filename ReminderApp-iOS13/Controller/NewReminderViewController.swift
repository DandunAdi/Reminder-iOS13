//
//  NewReminderViewController.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 22/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    var indexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let index = indexToEdit {
            let reminder = ReminderService.shared.getReminder(at: index)
            
            titleLabel.text = reminder.title
            datePicker.date = reminder.date
            completedSwitch.isOn = reminder.isCompleted
        }
    }
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        let reminder = Reminder(title: titleLabel.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        
        if let index = indexToEdit {
            ReminderService.shared.update(reminder, at: index)
        } else {
            ReminderService.shared.create(reminder)
        }
        
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
}
