//
//  JournalEntry.swift
//  MyJournal
//
//  Created by Oskar Larsson on 2022-09-06.
//

import Foundation

// JournalEntry defines a single entry in journal
struct JournalEntry {
    
    private var formatter = DateFormatter()
    private var unformattedDate: Date
    var content: String
    var title: String
    private var myDateFormat = "yyyy-MM-dd"
    
    var date: String {
        return formatter.string(from: unformattedDate)
    }
    
    init (title: String, content: String) {
        self.formatter.dateFormat = myDateFormat
        self.content = content
        self.title = title
        self.unformattedDate = Date()
    }
    
    init(title: String, content: String, date: Date) {
        self.formatter.dateFormat = myDateFormat
        self.content = content
        self.title = title
        self.unformattedDate = date
    }
    
}
