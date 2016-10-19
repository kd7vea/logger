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
    
    static fileprivate var dateAndTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    
    static fileprivate var iso8601DateAndTimeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'";
        let tz = TimeZone(abbreviation:"GMT")
        formatter.timeZone = tz
        return formatter
    }

}


// MARK: - NSDate extension

extension Date {

    var dateAndTimeString: String {
        return DateFormatters.dateAndTimeFormatter.string(from: self)
    }
    
    var iso8601DateAndTimeString: String {
        return DateFormatters.iso8601DateAndTimeFormatter.string(from: self)
    }

    var isToday: Bool {
        let now = Date()
        let calender = Calendar.current
        let flags: NSCalendar.Unit = [.day, .month, .year]
        let componentsOne = (calender as NSCalendar).components(flags, from: self)
        let componentsTwo = (calender as NSCalendar).components(flags, from: now)
        return (componentsOne.day == componentsTwo.day && componentsOne.month == componentsTwo.month && componentsOne.year == componentsTwo.year)
    }
    
    var startOfDay: Date {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.era, .year, .month, .day], from: self)
        let startOfDate = calendar.date(from: components)!
        return startOfDate
    }
    
    var endOfDay: Date {
        let calendar = Calendar.current
        let nextDay = (calendar as NSCalendar).date(byAdding: .day, value: 1, to: self, options: [])!
        let components = (calendar as NSCalendar).components([.era, .year, .month, .day], from: nextDay)
        let startOfDate = calendar.date(from: components)!
        return startOfDate
    }
    
    static fileprivate let formatters = [DateFormatters.dateAndTimeFormatter, DateFormatters.iso8601DateAndTimeFormatter]
    
    static func fromDateString(_ dateString:String) -> Date! {
        for formatter in formatters {
            if let date = formatter.date(from: dateString) {
                return date
            }
        }
        return .none
    }
    
}
