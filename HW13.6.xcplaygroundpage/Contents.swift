//: [Previous](@previous)

import Foundation
//1.
let triSagrass = (age: 27, worldStatus: "asecreta", imperStatus: "patrician, the 2nd" , born: "Tesclaan" )
let mahitDzmare = (age: 23, worldStatus: "posol", imperStatus: "varvar", born: "Lsel Cosmo Station")

triSagrass.0
triSagrass.1
triSagrass.2
triSagrass.3

mahitDzmare.age
mahitDzmare.worldStatus
mahitDzmare.imperStatus
mahitDzmare.born

//2.

let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] // массив «дни в месяцах».
let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "Nobember", "December"] // массив с названиями месяцев.


for day in daysInMonth {
    print (day)
}

var counter = 0
for day in daysInMonth {
    print (" In \(monthNames[counter]) is \(day) days")
    counter += 1
}

var monthNamesVar2 = monthNames
var cortedgeDaysAndMonth: Array<(String, Int)> = []
var timelyCortedge:(String, Int) = ("Month", 0)

counter = 0
for day in daysInMonth {  //кортеж с параметрами (имя месяца, количество дней).
    timelyCortedge.0 = monthNames[counter]
    timelyCortedge.1 = day
    cortedgeDaysAndMonth.append(timelyCortedge)
    counter += 1
}


for item in cortedgeDaysAndMonth.reversed() { // Выведены в обратном порядке без изменения исходного массива.
    print(item)
}

print(cortedgeDaysAndMonth)//Исходный массив не изменен

//4 июня 4.06

let foundDay = 4
let foundMonth = 6
var notCompleteMonth = daysInMonth[foundMonth-1] - foundDay
var amountOfRemainingDays = daysInMonth.dropFirst(foundMonth).reduce(notCompleteMonth, +) //количество дней от выбранной даты до конца НЕвысокосного года

//3.
var classJornal: [String: Int] = ["Анастасия Мышова":4, "Олег Баглюк": 3, "Филанович Дмитрий":5, "Люси Лавро":2, "Тимур Черкасов":4]

classJornal.updateValue(3, forKey: "Олег Баглюк")


func curentAssesment(){
for (key, value) in classJornal{
    
    if value > 2{
        if value > 4{
            print("\(key), Великолепно! Продолжай в том же дуже!")
            
        } else {
        print("\(key), Хорошая работа! Есть куда стремиться")
        
        }
    } else {
        print("\(key), Неуд, бро, на передсачу")
        
    }
}
}
curentAssesment() //Если оценка положительная (4 или 5) или удовлетворительная (3), выведено сообщение с поздравлением, отрицательная (1, 2) — студента отправили на пересдачу.

classJornal["Максим Мигалко"] = 3

classJornal["Мария Бастрыкина"] = 2

classJornal["Роберт Бикмурзин"] = 4

classJornal.removeValue(forKey: "Люси Лавро")

let gradePointAverage = classJornal.values.reduce(0, +)/classJornal.count

print("Средняя успеваемость в классе - \(gradePointAverage) балла")
