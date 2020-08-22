//
//  HomeViewController.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 20/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ReminderService.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        cell.updateCell(reminder: ReminderService.shared.getReminder(at: indexPath.row))
        return cell
    }
}
