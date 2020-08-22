//
//  NewReminderViewController.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 22/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class NewReminderViewController: UIViewController {
    
    @IBAction func saveButtonDidTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
    
    @IBAction func backButtonDidTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "HomeSegue", sender: self)
    }
}
