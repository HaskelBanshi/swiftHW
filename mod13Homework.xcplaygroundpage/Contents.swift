//: [Previous](@previous)

import UIKit

let urlStringAdres = "https://jsonplaceholder.typicode.com/todos/1"

let url = URL (string: urlStringAdres)

var id: Int = 0
var userId: Int = 0
var title: String = ""
var completed: Bool = false
 



// Создадим функцию, которая будет имитировать нажатие пользователем кнопки


func userTapOnButtom() {
  
    getRequest { idFromJson , userIdFromJson , titleFromJson , completedFromJson in
        
        id = idFromJson
        userId = userIdFromJson
        title = titleFromJson
        completed = completedFromJson
        
        printResult()
    }
}
               
               

func printResult(){
    print(id)
    print(userId)
    print(title)
    print(completed)
}

func getRequest(closure: @escaping(Int, Int, String, Bool) -> ()){

    let session = URLSession.shared

   
    guard let url = url else { return }
    
    
    session.dataTask (with : url )  { data , _ , error in
        
    guard let data = data else { return }
       
    do {
             
        let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
            
        let idFromJson = json["id"] as! Int
        let userIdFromJson = json ["userId"] as! Int
        let titleFromJson = json ["title"] as! String
        let completedFromJson = json ["completed"] as! Bool
            
        closure (idFromJson, userIdFromJson, titleFromJson, completedFromJson)
            
            
        }catch{
        print(error.localizedDescription)
        }
   }.resume()
}

    
userTapOnButtom()

