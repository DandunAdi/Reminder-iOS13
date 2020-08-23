//
//  HomeViewController.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 20/08/20. 
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditSegue", let destination = segue.destination as? NewReminderViewController, let editButton = sender as? UIButton {
            destination.indexToEdit = editButton.tag
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ReminderService.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderCell", for: indexPath) as! ReminderCell
        cell.updateCell(reminder: ReminderService.shared.getReminder(at: indexPath.row), index: indexPath.row)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ReminderService.shared.toggleCompleted(at: indexPath.row)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ReminderService.shared.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
