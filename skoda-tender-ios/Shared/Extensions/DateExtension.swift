//
//  DateExtension.swift
//  skoda-tender-ios
//
//  Created by Fábio Barreiros on 24/10/2024.
//

import Foundation

public enum DateHelper {
    public static let defaultFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    public static let defaultLocale = Locale.current
    public static let defaultTimezone = TimeZone(secondsFromGMT: 0)
    private static func getDateFormatter(with locale: Locale = defaultLocale, dateFormat: String = defaultFormat) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        if !dateFormat.lowercased().contains("z") { /// If doesnt contains timezone then add the default
            dateFormatter.timeZone = defaultTimezone
        }
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }

    /**
     Parses the given `String` to `Date`.

     - Parameter `date`: the `String` to be parsed to `Date`
     `format`: desired format, default is `yyyy-MM-dd'T'HH:mm:ss.SSSZ`
     `locale`: desired locale, default is `en_US_POSIX`

     - Returns: `Date`, or nil if the conversion wasn't successful.
     */
    public static func parse(date: String, format: String = defaultFormat, locale: Locale = defaultLocale) -> Date? {
        getDateFormatter(with: locale, dateFormat: format).date(from: date)
    }

    /**
     Formats the given `Date` to `String`.

     - Parameter `date`: the date to be parsed to `String`
     `format`: desired format, default is `yyyy-MM-dd'T'HH:mm:ss.SSSZ`
     `locale`: desired locale, default is `en_US_POSIX`

     - Returns: `String`, or nil if the conversion wasn't successful.
     */
    public static func format(date: Date, format: String = defaultFormat, locale: Locale = defaultLocale) -> String {
        getDateFormatter(with: locale, dateFormat: format).string(from: date)
    }

    public static func timeElapsed(startDate: Date, endDate: Date, calendarComponent: Calendar.Component) -> Int? {
        let timeInterval = Calendar.current.dateComponents([calendarComponent], from: startDate, to: endDate)

        switch calendarComponent {
        case .era:
            return timeInterval.era

        case .year:
            return timeInterval.year

        case .month:
            return timeInterval.month

        case .day:
            return timeInterval.day

        case .hour:
            return timeInterval.hour

        case .minute:
            return timeInterval.minute

        case .second:
            return timeInterval.second

        case .nanosecond:
            return timeInterval.nanosecond

        case .weekday:
            return timeInterval.weekday

        case .weekdayOrdinal:
            return timeInterval.weekdayOrdinal

        case .quarter:
            return timeInterval.quarter

        case .weekOfMonth:
            return timeInterval.weekOfMonth

        case .weekOfYear:
            return timeInterval.weekOfYear

        case .yearForWeekOfYear:
            return timeInterval.yearForWeekOfYear

        default:
            return nil
        }
    }

    public static func isSameDay(firstDate: Date, secondDate: Date) -> Bool {
        DateHelper.isInSameTime(firstDate: firstDate, secondDate: secondDate, timeUnity: Calendar.Component.day)
    }

    public static func isSameMonth(firstDate: Date, secondDate: Date) -> Bool {
        DateHelper.isInSameTime(firstDate: firstDate, secondDate: secondDate, timeUnity: Calendar.Component.month)
    }

    public static func isSameYear(firstDate: Date, secondDate: Date) -> Bool {
        DateHelper.isInSameTime(firstDate: firstDate, secondDate: secondDate, timeUnity: Calendar.Component.year)
    }

    public static func isInSameTime(firstDate: Date, secondDate: Date, timeUnity: Calendar.Component) -> Bool {
        Calendar.current.isDate(firstDate, equalTo: secondDate, toGranularity: timeUnity)
    }

    /// Creates a new date by combining the year, month and day from the first argument, and the hour, minute and second from the second
    public static func combine(date: Date, withTime time: Date) -> Date? {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: time)

        var mergedComponments = DateComponents()
        mergedComponments.year = dateComponents.year!
        mergedComponments.month = dateComponents.month!
        mergedComponments.day = dateComponents.day!
        mergedComponments.hour = timeComponents.hour!
        mergedComponments.minute = timeComponents.minute!
        mergedComponments.second = timeComponents.second!

        return calendar.date(from: mergedComponments)
    }
}
