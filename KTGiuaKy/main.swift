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
    
    guard let hangStrNew = hangStr, let cotStrNew = cotStr, let hang = Int(hangStrNew), let cot = Int(cotStrNew) else {
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

//veHCN()

// MARK: -Bài 2:

func isLeapYear(_ year:Int) -> Bool {
    if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
        return true
    }
    return false
}

func soNgayTrongThang(_ month:Int, _ year:Int) -> Int{
    switch month {
    case 1, 3, 5, 7, 8, 10, 12:
        return 31
    case 4, 6, 9, 11:
        return 30
    default:
        if isLeapYear(year) {
            return 29
        }
        return 28
    }
}

func hopLe(_ day:Int, _ month:Int, _ year:Int) -> Bool {
    var result:Bool = true
    
    if year < 1 {
        result = false
    }
    if month < 1 || month > 12 {
        result = false
    }
    if !(day >= 1 && day <= soNgayTrongThang(month, year)) {
        result = false
    }
    return result
}

func timNgayHomTruoc(_ day:Int, _ month:Int, _ year:Int) {
    var ngay = day
    var thang = month
    var nam = year
    
    ngay -= 1
    if ngay == 0 {
        thang -= 1
        if thang == 0 {
            thang = 12
            nam -= 1
        }
        ngay = soNgayTrongThang(thang, nam)
    }
    print("Ngày trước đó là \(ngay)|\(thang)|\(nam)")
}

func timNgayHomSau(_ day:Int, _ month:Int, _ year:Int) {
    var ngay = day
    var thang = month
    var nam = year
    
    ngay += 1
    if ngay > soNgayTrongThang(thang, nam) {
        ngay = 1
        thang += 1
        if thang > 12 {
            thang = 1
            nam += 1
        }
    }
    print("Ngày sau đó là \(ngay)|\(thang)|\(nam)")
}

func timNgay() {
    print("Mời nhập vào ngày:", terminator: " ")
    let dayStr = readLine()
    print("Mời nhập vào tháng:", terminator: " ")
    let monthStr = readLine()
    print("Mời nhập vào năm:", terminator: " ")
    let yearStr = readLine()
    
    guard let dayStrNew = dayStr, let monthStrNew = monthStr, let yearStrNew = yearStr, let day = Int(dayStrNew), let month = Int(monthStrNew), let year = Int(yearStrNew) else {
        print("Nhập sai! Mời nhập lại")
        timNgay()
        return
    }
    
    if hopLe(day, month, year) {
        print("Tháng \(month) có \(soNgayTrongThang(month, year))")
        timNgayHomTruoc(day, month, year)
        timNgayHomSau(day, month, year)
    }
    
}

//timNgay()

//MARK: - Bài 3:

func miniGame() {
    print("Mời bạn nhập 1 số bất kì trong khoảng từ 1 đến 100:", terminator: " ")
    let optionStr = readLine()
    guard let optionStrNew = optionStr, let option = Int(optionStrNew) else {
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

//miniGame()

// MARK: Tìm số Armstrong

func countDigit(_ num:Int) -> Int {
    var newNum = num
    var count = 0
    
    while newNum > 0 {
        newNum /= 10
        count += 1
    }
    
    return count
}

func isArmstrong(_ num:Int) -> Bool {
    var number = num
    let count = countDigit(number)
    var sum:Double = 0
    var lastDigit:Int
    
    while number > 0 {
        lastDigit = number % 10
        number /= 10
        sum += pow(Double(lastDigit), Double(count))
    }
    if Int(sum) == num {
        return true
    }
    return false
}

func timSoArmstrong() {
    print("Mời nhập 1 số:", terminator: " ")
    let numSTr = readLine()
    
    guard let newNumStr = numSTr, let num = Int(newNumStr) else {
        return
    }
    print("Các số Armstrong nhỏ hơn \(num) là:")
    for i in 0...num {
        if isArmstrong(i) {
            print(i)
        }
    }
}

timSoArmstrong()
