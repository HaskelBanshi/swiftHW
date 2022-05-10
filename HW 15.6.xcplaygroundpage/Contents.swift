import Foundation
//1.
enum httpStatusCode: Error{
    case error400 // cинтаксическая ошибка в запросе
    case error404 // не найдены данные по запросу
    case error418 // use in case when some Yankee blocks some your site in search engine
    case error500 // внутрення ошибка сервера
}

var error400: Bool = false
var error404: Bool = true
var error418: Bool = false
var error500: Bool = false

do {
    if error400{
        throw httpStatusCode.error400
    }
    if error404{
        throw httpStatusCode.error404
    }
    if error418{
        throw httpStatusCode.error418
    }
    if error500{
        throw httpStatusCode.error500
    }
}catch httpStatusCode.error400{
    print("400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.")
}catch httpStatusCode.error404{
    print("404 Not Found -  клиент был в состоянии общаться с сервером, но сервер не может найти данные согласно запросу.")
}catch httpStatusCode.error418{
    print("418 I'm a teapot - and I cannot brew a cup of coffee")
}catch httpStatusCode.error500{
    print("500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса. ")
}
//2.
func checkHttpStatus() throws{
    if error400{
        throw httpStatusCode.error400
    }
    if error404{
        throw httpStatusCode.error404
    }
    if error418{
        throw httpStatusCode.error418
    }
    if error500{
        throw httpStatusCode.error500
    }
    
}

error404 = false
error418 = true

do{
    try checkHttpStatus()
}catch httpStatusCode.error400{
    print("400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.")
}catch httpStatusCode.error404{
    print("404 Not Found -  клиент был в состоянии общаться с сервером, но сервер не может найти данные согласно запросу.")
}catch httpStatusCode.error418{
    print("418 I'm a teapot - and I cannot brew a cup of coffee")
}catch httpStatusCode.error500{
    print("500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса. ")
}

//3.
func chechEquityOfTypes<T, E>(a: T, b: E)  {
    
    if type(of: a) == type(of: b){
       print ("Yes")
    }else{
        print ("No")
    }
}

chechEquityOfTypes(a: 3, b: "One of the worst in th world")

//4.

enum typesEquality: Error{
    case equal
    case notequal
}
func chechEquityOfTypesWithErrorChecking<T, E>(a: T, b: E) throws {

    if type(of: a) == type(of: b){
        throw typesEquality.equal
    }else{
        throw typesEquality.notequal
    }
}

do{
    try chechEquityOfTypesWithErrorChecking(a: 6, b: 3301)
}catch typesEquality.equal{
    print("Типы входных данных идентичны")
}catch typesEquality.notequal{
    print("Типы входных данных отличаются")
}
//5.

func compareTwoIncomings <T: Equatable> (a: T, b: T){
    if a == b{
        print("Значения идентичны")
    }
    else {
        print("Значения отличаются")
    }
}
compareTwoIncomings(a: 34.0, b: 34)



