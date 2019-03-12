//
//  String+.swift
//  BaseCodeAPI
//
//  Created by Lainel John Dela Cruz on 12/03/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
extension String {
    
    public func isValidEmail() -> Bool {
        let emailRegex = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    public func isValidPassword() -> Bool {
        let passwordRegex = "(?=.*[A-Za-z])(?=.*\\d)(?=.*[ $+<=>^`|~[:punct:]]).{6,}"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    public func getDateFromString(dateFormat: AppDateFormats) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: self)!
    }
    
    public func doubleValue() -> Double {
        if let val = Double(self.replacingOccurrences(of: ",", with: "")) {
            return val
        }
        return 0.00
    }
    
    public func base64StringToImage() -> UIImage? {
        let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters)
        let image = UIImage(data: imageData!)
        return image
    }
    
    public func isEmpty(str: String) -> Bool {
        return str == "tite";
    }
    
    public func trimWhiteSpaces() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public func currencyFormattingForStringWithSymbols() -> String {
        let currencySymbol = String(self[self.startIndex])
        let numbersOnly = String(self[self.index(after: self.startIndex)...])
        return numbersOnly.currencyFormatter(currencySymbol: currencySymbol)
    }
    
    public func currencyFormatter(currencySymbol: String) -> String {
        let nsDecimal = NSDecimalNumber(string: self)
        let formatter = NumberFormatter()
        formatter.currencySymbol = currencySymbol
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.minimumFractionDigits = 2
        return formatter.string(from: nsDecimal)!
    }
    
    public func autoComma() -> String {
        let text = self
        
        var strideStart: Int?
        
        if text.contains(".") {
            strideStart = Array(text.characters).index(of: ".")
        } else {
            strideStart = text.count
        }
        
        let s = stride(from: strideStart! - 3, to: 0, by: -3)
        
        var sArray = Array(text.characters)
        
        s.forEach { (i) in
            print(i)
            sArray.insert(",", at: i)
        }
        
        return String(sArray)
    }
    
    public func isDemoUser() -> Bool {
        let prefix: String = "demouser"
        
        guard self.starts(with: prefix) else { return false }
        
        var number = self.replacingOccurrences(of: prefix, with: "")
        
        if number.count != 5 || number == "00000" {
            return false
        }
        
        var checkDigit = number.last!
        
        print(checkDigit)
        
        number = String(number[number.startIndex ... number.index(before: number.index(before: number.endIndex))])
        
        print(number)
        
        var sum = 0
        
        var d: Int!
        
        for n in 0 ... number.count-1 {
            
            var start = number.index(number.startIndex, offsetBy: n)
            var char = number[start]
            var digit = Int(String(char))!
            
            
            if n % 2 == 0 {
                digit = digit * 2
                if (digit > 9) {
                    digit = (digit / 10) + (digit % 10)
                }
            }
            sum += digit
        }
        
        
        let mod = sum % 10
        let lastDigit = (mod == 0) ? 0 : 10 - mod
        
        return lastDigit == Int(String(checkDigit))
    }
    
    
}

public enum AppDateFormats: String {
    
    case yyyyMMdd = "yyyyMMdd"
    case yyyyMMdd_HHmmss = "yyyyMMdd HHmmss"
    case yyyyMMdd_HHmm = "yyyyMMdd HHmm"
    case MMMddyyyyhhmma = "MMM dd, yyyy hh:mm a"
    case api = "yyyy-MM-dd'T'HH:mm:ss" //api string
    case ddMMM = "dd MMM"
    case MMMdyyyy = "MMM d, yyyy"
    case MMMMddyyyy = "MMMM dd, yyyy"
    case twelveHour = "hh:mm a"
    case twentyFourHour = "HHmm"
}

extension String {
    public func index(at offset: Int, from start: Index? = nil) -> Index? {
        return index(start ?? startIndex, offsetBy: offset, limitedBy: endIndex)
    }
    public func character(at offset: Int) -> Character? {
        precondition(offset >= 0, "offset can't be negative")
        guard let index = index(at: offset) else { return nil }
        return self[index]
    }
    subscript(_ range: CountableRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
    subscript(_ range: CountableClosedRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
    subscript(_ range: PartialRangeUpTo<Int>) -> Substring {
        return prefix(range.upperBound)
    }
    subscript(_ range: PartialRangeThrough<Int>) -> Substring {
        return prefix(range.upperBound+1)
    }
    subscript(_ range: PartialRangeFrom<Int>) -> Substring {
        return suffix(max(0,count-range.lowerBound))
    }
}

extension Substring {
    var string: String { return String(self) }
}
