//
//  Reminder.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 22/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import Foundation

struct Reminder: Codable {
    var title: String
    var date: Date
    var isCompleted: Bool
}
