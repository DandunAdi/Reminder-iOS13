//
//  ReminderCell.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 20/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import UIKit

class ReminderCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateCell(reminder: Reminder) {
        titleLabel.text = reminder.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        dateLabel.text = formatter.string(from: reminder.date)
        
        // corner radius
        containerView.layer.cornerRadius = 15
        

        // add striketrough on text
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: titleLabel.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: reminder.isCompleted ? 2 : 0, range: NSMakeRange(0, attributeString.length))
        titleLabel.attributedText = attributeString
        
        titleLabel.textColor = reminder.isCompleted ? UIColor(named: "textGray") : UIColor(named: "textDarkPurple")
        dateLabel.textColor = reminder.isCompleted ? UIColor(named: "textGray") : UIColor(named: "textDarkPurple")
    
    }
}
