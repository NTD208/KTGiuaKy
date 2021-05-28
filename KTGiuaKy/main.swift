//
//  main.swift
//  KTGiuaKy
//
//  Created by Chu Du on 28/05/2021.
//

import Foundation

// MARK: Bài 1:

func veHCN() {
    print("Mời nhập số hàng:", terminator: " ")
    let hangStr = readLine()
    print("Mời nhập số cột:", terminator: " ")
    let cotStr = readLine()
    
    guard let hangStr = hangStr, let cotStr = cotStr, let hang = Int(hangStr), let cot = Int(cotStr) else {
        return
    }
    for i in 1...hang {
        if i == 1 || i == hang {
            for _ in 1...cot {
                print("*", terminator: "\t")
            }
        } else {
            print("*", terminator: "\t")
            for _ in 0..<(cot-2) {
                print(" ", terminator: "\t")
            }
            print("*", terminator: "\t")
        }
        print("\n")
    }
}

veHCN()

// MARK: -Bài 2:

func isLeapYear(_ year:Int) -> Bool {
    if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
        return true
    }
    return false
}

func timNgay() {
    print("Mời nhập vào ngày:", terminator: " ")
    let dayStr = readLine()
    print("Mời nhập vào tháng:", terminator: " ")
    let monthStr = readLine()
    print("Mời nhập vào năm:", terminator: " ")
    let yearStr = readLine()
    
    guard let dayStr = dayStr, let monthStr = monthStr, let yearStr = yearStr, let day = Int(dayStr), let month = Int(monthStr), let year = Int(yearStr) else {
        print("Nhập sai! Mời nhập lại")
        timNgay()
        return
    }
    
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        print("Tháng \(month) có 31 ngày")
        
        switch day {
        case 2...30:
            print("Ngày trước đó là ngày \(day - 1)")
            print("Ngày sau đó là ngày \(day + 1)")
        case 1:
            if month == 8 || month == 1 {
                print("Ngày trước đó là ngày 31")
            } else if month == 3 {
                if isLeapYear(year) {
                    print("Ngày trước đó là ngày 29")
                } else {
                    print("Ngày trước đó là ngày 28")
                }
            } else {
                print("Ngày trước đó là ngày 30")
            }
            print("Ngày sau đó là ngày \(day + 1)")
        case 31:
            print("Ngày trước đó là ngày \(day - 1)")
            print("Ngày sau đó là ngày 1")
        default:
            print("Ngày không hợp lệ")
        }
        
    case 4, 6, 9, 11:
        print("Tháng \(month) có 30 ngày")
        
        switch day {
        case 2...29:
            print("Ngày trước đó là ngày \(day - 1)")
            print("Ngày sau đó là ngày \(day + 1)")
        case 1:
            print("Ngày trước đó là ngày 31")
            print("Ngày sau đó là ngày \(day + 1)")
        case 30:
            print("Ngày trước đó là ngày \(day - 1)")
            print("Ngày sau đó là ngày 1")
        default:
            print("Ngày không hợp lệ")
        }
        
    case 2:
        if isLeapYear(year) {
            print("Tháng \(month) có 29 ngày")
            
            switch day {
            case 2...28:
                print("Ngày trước đó là ngày \(day - 1)")
                print("Ngày sau đó là ngày \(day + 1)")
            case 1:
                print("Ngày trước đó là ngày 31")
                print("Ngày sau đó là ngày \(day + 1)")
            case 29:
                print("Ngày trước đó là ngày \(day - 1)")
                print("Ngày sau đó là ngày 1")
            default:
                print("Ngày không hợp lệ")
            }
        } else {
            print("Tháng \(month) có 28 ngày")
            
            switch day {
            case 2...27:
                print("Ngày trước đó là ngày \(day - 1)")
                print("Ngày sau đó là ngày \(day + 1)")
            case 1:
                print("Ngày trước đó là ngày 31")
                print("Ngày sau đó là ngày \(day + 1)")
            case 28:
                print("Ngày trước đó là ngày \(day - 1)")
                print("Ngày sau đó là ngày 1")
            default:
                print("Ngày không hợp lệ")
            }
        }
    default:
        print("Nhập sai tháng")
    }
}

timNgay()

//MARK: - Bài 3:

func miniGame() {
    print("Mời bạn nhập 1 số bất kì trong khoảng từ 1 đến 100:", terminator: " ")
    let optionStr = readLine()
    guard let optionStr = optionStr, let option = Int(optionStr) else {
        return
    }
    
    let randomNum:Int = Int.random(in: 1...100)
    
    if option == randomNum {
        print("Chúc mừng! bạn đã trả lời đúng.")
    } else if option < randomNum {
        print("Số của bạn bé hơn kết quả.")
    } else {
        print("Số của bạn lớn hơn kết quả.")
    }
}

miniGame()
