import Foundation
//1.
enum httpStatusCode: Error{
    case err400 // cинтаксическая ошибка в запросе
    case err404 // не найдены данные по запросу
    case err418 // use in case when some Yankee block some your site in search engine
    case err500 // внутрення ошибка сервера
}

var err400: Bool = false
var err404: Bool = true
var err418: Bool = false
var err500: Bool = false

do {
    if err400{
        throw httpStatusCode.err400
    }
    if err404{
        throw httpStatusCode.err404
    }
    if err418{
        throw httpStatusCode.err418
    }
    if err500{
        throw httpStatusCode.err500
    }
}catch httpStatusCode.err400{
    print("400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.")
}catch httpStatusCode.err404{
    print("404 Not Found -  клиент был в состоянии общаться с сервером, но сервер не может найти данные согласно запросу.")
}catch httpStatusCode.err418{
    print("418 I'm a teapot - and I cannot brew a cup of coffee")
}catch httpStatusCode.err500{
    print("500 Internal Server Error — любая внутренняя ошибка сервера, которая не входит в рамки остальных ошибок класса. ")
}
//2.
func checkHttpStatus() throws{
    if err400{
        throw httpStatusCode.err400
    }
    if err404{
        throw httpStatusCode.err404
    }
    if err418{
        throw httpStatusCode.err418
    }
    if err500{
        throw httpStatusCode.err500
    }
    
}

err404 = false
err418 = true

do{
    try checkHttpStatus()
}catch httpStatusCode.err400{
    print("400 Bad Request — сервер обнаружил в запросе клиента синтаксическую ошибку.")
}catch httpStatusCode.err404{
    print("404 Not Found -  клиент был в состоянии общаться с сервером, но сервер не может найти данные согласно запросу.")
}catch httpStatusCode.err418{
    print("418 I'm a teapot - and I cannot brew a cup of coffee")
}catch httpStatusCode.err500{
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



