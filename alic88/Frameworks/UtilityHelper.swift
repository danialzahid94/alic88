//
//  extrasClass.swift
//  MyDocChat
//
//  Created by Vikas Baru on 29/05/15.
//  Copyright (c) 2015 VikasBaru. All rights reserved.
//

import UIKit

class UtilityHelper: NSObject {
    
    //Singleton of Globals
    class var sharedData:UtilityHelper{
        struct Singleton{
            static let instance = UtilityHelper()
        }
        return Singleton.instance
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let PHONE_REGEX = "^\\d{10}$"
    
    var msgWrongPassword = "Password & Confirm password are not match"
    var msgInvalidEmail = "Invalid Email"
    var msgInvalidMobile = "Invalid Mobile"
    var msgFillAll = "Fill All Field"
    
    func isValidEmail(testStr:String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailTest.evaluateWithObject(testStr) {
            return true
        }
        return false
    }
    
    func isMobileValid(value: String) -> Bool {
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        
        if phoneTest.evaluateWithObject(value) {
            return true
        }
        return false
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        
        let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0) )
        
        var decodedimage = UIImage(data: decodedData!)
        
        return decodedimage!
        
    }
    
    func stringToNSDate(strDate:NSString) -> String {
        let timeInterval:NSTimeInterval = strDate.doubleValue
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let time = timeAgoSinceDate(date, numericDates: true)
        
        return time
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        
        
        let calendar = NSCalendar.currentCalendar()
        let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
        
        
        let now = NSDate()
        let earliest = now.earlierDate(date)
        let latest = (earliest == now) ? date : now
        let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
        
        if (components.year >= 2) {
            return "\(components.year) years ago"
        } else if (components.year >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month >= 2) {
            return "\(components.month) months ago"
        } else if (components.month >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear >= 2) {
            return "\(components.weekOfYear) weeks ago"
        } else if (components.weekOfYear >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day >= 2) {
            return "\(components.day) days ago"
        } else if (components.day >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour >= 2) {
            return "\(components.hour) hours ago"
        } else if (components.hour >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute >= 2) {
            return "\(components.minute) minutes ago"
        } else if (components.minute >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second >= 3) {
            return "\(components.second) seconds ago"
        } else {
            return "Just now"
        }
        
    }
    
    func Shadow(sender: AnyObject, radious1 : CGFloat, color : CGColor) -> AnyObject {
        
        var element : AnyObject = sender as AnyObject
        
        element.layer.shadowColor = color
        element.layer.shadowOffset = CGSizeMake(3, 3)
        element.layer.shadowRadius = radious1
        element.layer.shadowOpacity = 0.5
        
        return element;
    }
    
    func Glow(sender: AnyObject, radious1 : CGFloat, color : CGColor, opacity: Float) -> AnyObject {
        
        var element : AnyObject = sender as AnyObject
        
        element.layer.shadowColor = color
        element.layer.shadowOffset = CGSizeMake(0, 0)
        element.layer.shadowRadius = radious1
        element.layer.shadowOpacity = opacity
        
        return element;
    }
    
    func Border(sender: AnyObject, borderwidth : CGFloat , radious1 : CGFloat, color : CGColor) -> AnyObject {
        
        var element : AnyObject = sender as AnyObject
        
        element.layer.cornerRadius = radious1
        element.layer.borderWidth = borderwidth
        element.layer.borderColor = color
        //UIColor(red: 235.0/255.0, green: 231.0/255.0, blue: 231.0/255.0, alpha: 1.0).CGColor
        return element;
    }
    
    func bottomBorder(sender: AnyObject, padding: CGFloat) -> Void{
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 0.65).CGColor;
        border.frame = CGRect(x: padding, y: sender.frame.size.height - width, width:  sender.frame.size.width-padding, height: sender.frame.size.height)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }
    
    func bottomBorder(sender: AnyObject) -> Void{
        bottomBorder(sender, padding: 0.0)
    }

    func bottomBorderWhite(sender: AnyObject) -> Void{
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        border.frame = CGRect(x: 0, y: sender.frame.size.height - width, width:  sender.frame.size.width, height: sender.frame.size.height)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }

    func topBorder(sender: AnyObject) -> Void{
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 0.7).CGColor;
        border.frame = CGRect(x: 0, y: 0, width:  sender.frame.size.width, height: 1)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }
    
    //    func jsonParser(url : String) -> NSDictionary
    //    {
    //        var jsonObject : NSDictionary = NSDictionary()
    //        let curURL: NSURL = NSURL(string: url)!
    //        let curRequest: NSURLRequest = NSURLRequest(URL: curURL, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
    //
    //        NSURLConnection.sendAsynchronousRequest(curRequest, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData?, error: NSError!) -> Void in
    //
    //            if (data != nil) {
    //                if let jsonArray: NSArray = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray? {
    //                    jsonObject = jsonArray.objectAtIndex(0) as NSDictionary
    //                }
    //            }
    //            else
    //            {
    //                println("null")
    //            }
    //
    //        }
    //        return jsonObject
    //    }
}
