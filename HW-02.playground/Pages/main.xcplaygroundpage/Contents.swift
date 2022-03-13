import UIKit
import Darwin

var selfDriveStatement = false // Переменная, которая хранит в себе режим управления:  автопилот или ручной ( true/false )

//Параметры машины

let weight = 2108       // вес в кг
let lenght = 4976       // длина в мм
let width = 1963        // ширина в мм с зеркалами
let height = 1435       // высота в мм
let wheelBase = 2959    // колесная база в мм
let clearance = 154.9   // клиренс в мм
let trunkCapacity = 900 // объем багажника

//Датчики
var openDoors = false   // датчик закрытия дверей
var parkingBreak = true // датчик поднятого ручника
var tirePressure = false// датчик низкого давления в шинах
var safetyBelt = true   // датчик непристегнутого ремня безопасности
var airBag = false      // датчик неисправности подушек безопасности
var sunroofStatement = 0// датчик открытия люка
var audioStatement = false // датчик состояния аудиосистемы
var condStatement = false  // датчик состояния кондиционера
var frontLightsOn = false  // фары включены/выключены
var spaceInFront = Int.max // растояние до парктроника спереди
var spaceUnder = 210.0     // растояние до парктроника спереди снизу
var spaceAbove = Int.max   // растояние до парктроника сверху
var spaceBehind = Int.max  // растояние до парктроника сзади
var spaceOnLeft = Int.max  // растояние до парктроника слева
var spaceOnRight = Int.max // растояние до парктроника справа

//Ошибки
enum AutoError: Error {
    case openDoors
    case parkingBreak
    case tirePressure
    case safetyBelt
    case airBag
}

//Часы
let today = Date() // Стягиваем системное время

let hours   = (Calendar.current.component(.hour, from: today))  // Часы
let minutes = (Calendar.current.component(.minute, from: today))// Минуты
let seconds = (Calendar.current.component(.second, from: today))// Секунды

// print("\(hours):\(minutes):\(seconds)") // Вывести время на экран

//Функционал
//Люк
func openSunroof(){
    if sunroofStatement > 99 {
        print("Люк полностью открыт")
    }else {
            sunroofStatement += 25
            print("Люк открыт на",sunroofStatement, "%")
}
}
func closeSunroof(){
if sunroofStatement < 1 {
    print("Люк полностью закрыт")
}else {
        sunroofStatement -= 25
        print("Люк открыт на",sunroofStatement, "%")
}
}
//Аудиосистема
func powerOnAudio(){
    audioStatement = true
    print("Из динамиков раздается белый шум")
}
func autoSearch(){
    if audioStatement {
        print("Вас приветствует авторадио")
    }else{
        print("Радио выключено - включите радио")
    }
}
func powerOffAudio(){
    if audioStatement {
        audioStatement = false
        print ("Радио выключено. Больше никаких назойливых звуков")
    } else {
        print("Тише все равно уже не будет...")
    }
}
//Кондиционер и климат
func conditionerOn(){
    condStatement = true
    print ("Кондиционер включен")
}
func conditionerOff(){
    condStatement = false
    print("Кондиционер выключен")
}
func climateOnWindow(){
    if condStatement{
        print("Включен обдув лобового стекла")
    } else{
        print("Включите конционер")
    }
}
func climateOnLegs(){
    if condStatement{
        print("Включен обдув в ноги")
    } else{
        print("Включите конционер")
    }
}
//Ручник
func parkingOff(){
    parkingBreak = false
    print ("Рукчник отпущен")
}
//Ремень безопасности
func lockSafetyBelt(){
    safetyBelt = false
    print("Ремень безопасноти пристегнут")
}
//Подкачка шин
func pumpTires(){
    if tirePressure{
        safetyBelt = true
        openDoors = true
        parkingBreak = true
        tirePressure = false
        print("Вы вышли из машины и подкачали шины")
    }
}
//Обработчик ошибок
func checkAllErrors() throws{
    if openDoors{
        throw AutoError.openDoors
    }
    if parkingBreak{
        throw AutoError.parkingBreak
    }
    if tirePressure{
        throw AutoError.tirePressure
    }
    if safetyBelt{
        throw AutoError.safetyBelt
    }
    if airBag{
        throw AutoError.airBag
    }
}
    do {
    try checkAllErrors()
    } catch AutoError.openDoors{
        print("Закройте двери перед началом движения")
    } catch AutoError.parkingBreak{
        print("Отпустите ручник перед началом движения")
    } catch AutoError.safetyBelt{
        print("Пристегните ремень безопасности")
    } catch AutoError.tirePressure{
        print("Проверьте давление в шинах")
    } catch AutoError.airBag{
        print("Подушки безопасности неисправны - обратитесь в сервис")
    }
//Автопилот и парктроник
func startAutoDriving(){
    print("\(hours):\(minutes):\(seconds)") // Show the time
    if openDoors || parkingBreak || tirePressure || safetyBelt {
        print("Cначала исправьте критические ошибки")
    }else {
        selfDriveStatement = true
        print("Автопилот запущен. Безоговорочно доверять автопилоту опасно для водителя и нужно следить за движением автомобиля")
    }
    if hours > 19 || hours < 6 {
        frontLightsOn = true
        print("Фары включены для лучшей видимости")
    }
}

func parktronic(){
    if spaceUnder > 100.0 || spaceAbove < 1000 || spaceBehind < 1000 || spaceOnLeft < 1000 || spaceOnRight < 1000 || spaceInFront < 1000 {
        selfDriveStatement = false
        print("Машина в опасной близости к препятствию, будьте осторожны. Автопилот недоступен")
    }
}

// Сценарий
startAutoDriving()
parktronic()

