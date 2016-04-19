//
//  NSDate+Helpers.swift
//  falkor
//
//  Created by Ben Norris on 1/26/16.
//  Copyright © 2016 BSN Design. All rights reserved.
//

import Foundation

struct DateFormatters {
    
    // MARK: - Private formatters
    
    static private var dateAndTimeFormatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .ShortStyle
        return formatter
    }
    
    static private var iso8601DateAndTimeFormatter: NSDateFormatter {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
        let tz = NSTimeZone(abbreviation:"GMT")
        formatter.timeZone = tz
        return formatter
    }

}


// MARK: - NSDate extension

extension NSDate {

    var dateAndTimeString: String {
        return DateFormatters.dateAndTimeFormatter.stringFromDate(self)
    }
    
    var iso8601DateAndTimeString: String {
        return DateFormatters.iso8601DateAndTimeFormatter.stringFromDate(self)
    }

    var isToday: Bool {
        let now = NSDate()
        let calender = NSCalendar.currentCalendar()
        let flags: NSCalendarUnit = [.Day, .Month, .Year]
        let componentsOne = calender.components(flags, fromDate: self)
        let componentsTwo = calender.components(flags, fromDate: now)
        return (componentsOne.day == componentsTwo.day && componentsOne.month == componentsTwo.month && componentsOne.year == componentsTwo.year)
    }
    
    var startOfDay: NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Era, .Year, .Month, .Day], fromDate: self)
        let startOfDate = calendar.dateFromComponents(components)!
        return startOfDate
    }
    
    var endOfDay: NSDate {
        let calendar = NSCalendar.currentCalendar()
        let nextDay = calendar.dateByAddingUnit(.Day, value: 1, toDate: self, options: [])!
        let components = calendar.components([.Era, .Year, .Month, .Day], fromDate: nextDay)
        let startOfDate = calendar.dateFromComponents(components)!
        return startOfDate
    }
    
    static private let formatters = [DateFormatters.dateAndTimeFormatter, DateFormatters.iso8601DateAndTimeFormatter]
    
    static func fromDateString(dateString:String) -> NSDate? {
        for formatter in formatters {
            if let date = formatter.dateFromString(dateString) {
                return date
            }
        }
        return .None
    }
    
}
