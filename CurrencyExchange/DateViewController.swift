//
//  DateViewController.swift
//  CurrencyExchange
//
//  Created by UTS on 2019/5/18.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import CVCalendar
typealias DateSelectedBlock = (_ date:String) -> ()

class DateViewController: UIViewController,CVCalendarViewDelegate,CVCalendarMenuViewDelegate {
    private var menuView: CVCalendarMenuView!
    private var calendarView: CVCalendarView!
    var currentCalendar: Calendar!
    var dateSelected:DateSelectedBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentCalendar = Calendar.init(identifier: .gregorian)
        self.title = CVDate(date: Date(), calendar: currentCalendar).globalDescription
        self.menuView = CVCalendarMenuView(frame: CGRect(x:(screenWidth - 300) * 0.5, y:80, width:300, height:15))
        self.calendarView = CVCalendarView(frame: CGRect(x:(screenWidth - 300) * 0.5, y:110, width:300,
                                                         height:450))
//        self.calendarView.backgroundColor = UIColor.blue
        self.menuView.menuViewDelegate = self
        self.calendarView.calendarDelegate = self
        self.view.addSubview(self.menuView)
        self.view.addSubview(self.calendarView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .monday
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        self.title = date.globalDescription
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func shouldAutoSelectDayOnMonthChange() -> Bool {
        return false
    }
    
    func didSelectDayView(_ dayView: CVCalendarDayView, animationDidFinish: Bool) {
        let date = dayView.date.convertedDate()!
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy-MM-dd"
        let dateStr:String = dformatter.string(from: date)
        if (self.dateSelected != nil) {
            self.dateSelected!(dateStr)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
