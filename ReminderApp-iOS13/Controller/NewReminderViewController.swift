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
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        let reminder = Reminder(title: titleLabel.text!, date: datePicker.date, isCompleted: completedSwitch.isOn)
        
        ReminderService.shared.create(reminder)
        
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
}
