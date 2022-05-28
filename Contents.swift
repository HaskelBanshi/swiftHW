//: [Previous](@previous)

import Foundation

// Абстракция данных пользователя
protocol UserData {
  var userName: String { get }    //Имя пользователя
  var userCardId: String { get }   //Номер карты
  var userCardPin: Int { get }       //Пин-код
  var userPhone: String { get }       //Номер телефона
  var userCash: Float { get set }   //Наличные пользователя
  var userBankDeposit: Float { get set }   //Банковский депозит
  var userPhoneBalance: Float { get set }    //Баланс телефона
  var userCardBalance: Float { get set }    //Баланс карты
}

// Протокол по работе с банком предоставляет доступ к данным пользователя зарегистрированного в банке
protocol BankApi {
    func showUserCardBalance()
    func showUserDepositBalance()
    func showUserToppedUpMobilePhoneCash(cash: Float)
    func showUserToppedUpMobilePhoneCard(card: Float)
    func showWithdrawalCard(cash: Float)
    func showWithdrawalDeposit(cash: Float)
    func showTopUpCard(cash: Float)
    func showTopUpDeposit(cash: Float)
    func showError(error: TextErrors)
 
    func checkUserPhone(phone: String) -> Bool
    func checkMaxUserCash(cash: Float) -> Bool
    func checkMaxUserCard(withdraw: Float) -> Bool
    func checkCurrentUser(userCardId: String, userCardPin: Int) -> Bool
 
    mutating func topUpPhoneBalanceCash(pay: Float)
    mutating func topUpPhoneBalanceCard(pay: Float)
    mutating func getCashFromDeposit(cash: Float)
    mutating func getCashFromCard(cash: Float)
    mutating func putCashDeposit(topUp: Float)
    mutating func putCashCard(topUp: Float)
}


// Действия, которые пользователь может выбирать в банкомате (имитация кнопок)
enum UserActions {
    case userChooseShowBalanse
    case userChooseWithdrawal (withdrawCash: Float)
    case userChooseTopUp (topUp: Float)
    case userChooseRefillPhoneNumber (phone: String)
}

// Виды операций, выбранных пользователем (подтверждение выбора)
enum DescriptionTypesAvailableOperations: String {
    case showBalanse = "Вы выбрали операцию - Запросить баланс"
    case withdrawalCash = "Вы выбрали операцию - Снять наличные"
    case topUp = "Вы выбрали операцию - Пополнить счет"
    case refillMobileAccount = "Вы выбрали операцию - Пополнить счет мобильного"
}
 
// Способ оплаты/пополнения наличными, картой или через депозит
enum PaymentMethod {
    case cash
    case deposit
}

// Тексты ошибок
enum TextErrors: String {
    case lowBalance = "Недостаточно денег для операции"
    case incorrectPin = "Неверный Пин"
    case incorrectPhoneNumber = "Неверно введен номер телефона"
    case rebelionOfRobots = "Банкомат временно не работает - попробуйте найти другой"
    
}

// Банкомат, с которым мы работаем, имеет общедоступный интерфейс sendUserDataToBank
class ATM {
    private let userCardId: String
    private let userCardPin: Int
    private var someBank: BankApi
    private let action: UserActions
    private let paymentMethod: PaymentMethod?
 
    init(userCardId: String, userCardPin: Int, someBank: BankApi, action: UserActions, paymentMethod: PaymentMethod? = nil) {
        self.userCardId = userCardId
        self.userCardPin = userCardPin
        self.someBank = someBank
        self.action = action
        self.paymentMethod = paymentMethod
 
    sendUserDataToBank(userCardId: userCardId, userCardPin: userCardPin, actions: action, payment: paymentMethod)
  }
 
 
  public final func sendUserDataToBank(userCardId: String, userCardPin: Int, actions: UserActions, payment: PaymentMethod?) {
      let autorizationSuccess = someBank.checkCurrentUser(userCardId: userCardId, userCardPin: userCardPin)
      if autorizationSuccess{
          switch actions{
          case .userChooseShowBalanse:
              someBank.showUserCardBalance()
          case let .userChooseRefillPhoneNumber(phone):
              if someBank.checkUserPhone(phone: phone){
                  if let payment = payment {
                      switch payment{
                      case let .cash(cash: payment):
                          if someBank.checkMaxUserCash(cash: payment){
                              someBank.topUpPhoneBalanceCash(pay: payment)
                              someBank.showUserToppedUpMobilePhoneCash(cash: payment)
                          } else {
                              someBank.showError(error: .lowBalance)
                          }
                      }
                  }
              }
              
          case .userChooseWithdrawal(withdrawCash: let withdrawCash):
              <#code#>
          case .userChooseTopUp(topUp: let topUp):
              <#code#>
          }
      }else{
          someBank.showError(error: .incorrectPin)
      }
  }
}
