//
//  ReminderService.swift
//  ReminderApp-iOS13
//
//  Created by DDD on 22/08/20.
//  Copyright © 2020 Dandun Adi. All rights reserved.
//

import Foundation

class ReminderService {
    
    static let shared = ReminderService()
    private var reminders = [Reminder]()
    
    private var url: URL
    
    private init() {
        url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        url.appendPathComponent("reminder.json")
        load()
    }
    
    //MARK: - Data Persistence methods
    
    func load() {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            reminders = try decoder.decode([Reminder].self, from: data)
        } catch {
            print("Error retrieving data from JSON \(error.localizedDescription)")
        }
    }
    
    func save() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(reminders)
            try data.write(to: url)
        } catch  {
            print("Error saving data \(error.localizedDescription)")
        }
    }
    
    
    //MARK: - Reminders Array's Methods
    
    // Create
    func create(_ reminder: Reminder) {
        
        // Add reminder in sorted order by date
        var indexToInsert: Int?
        for (index, element) in reminders.enumerated() {
            if element.date.timeIntervalSince1970 > reminder.date.timeIntervalSince1970 {
                indexToInsert = index
                break
            }
        }
        
        if let index = indexToInsert {
            reminders.insert(reminder, at: index)
        } else {
            reminders.append(reminder)
        }
        
        // Saving to JSON
        save()
    }
    
    // Get all of reminders
    func getAllReminders() -> [Reminder] {
        return reminders
    }
    
    // Get a specific reminder
    func getReminder(at index: Int) -> Reminder {
        return reminders[index]
    }
    
    // Update
    func update(_ reminder: Reminder, at index: Int) {
        reminders[index] = reminder
        save()
    }
    
    // Toggle isCompleted bool
    func toggleCompleted(at index: Int) {
        reminders[index].isCompleted.toggle()
        save()
    }
    
    // Delete
    func delete(at index: Int) {
        reminders.remove(at: index)
        save()
    }
    
}
