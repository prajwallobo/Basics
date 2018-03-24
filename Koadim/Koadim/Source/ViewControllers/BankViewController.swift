//
//  BankViewController.swift
//  Koadim
//
//  Created by Prajwal Lobo on 24/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

//MARK:-
public enum Transaction{
    case credit
    case debit
    case balance
    case none
}

//MARK:-
public class CreditManager{
    public var balance : Int
    init(balance : Int? = 0) {
        self.balance = balance!
    }
    
    //MARK:-
    public func add(entry : Entry) -> (status : Bool, balance : Int){
        balance = balance + entry.credits
        if balance >= 0 {
            return(true, balance)
        }else{
            return(false, balance)
        }
        
    }
    
    //MARK:-
    public func deduct(entry : Entry) -> (status : Bool, balance : Int){
        if balance - entry.credits >= 0{
            balance = balance - entry.credits
            return(true, balance)
        }else{
            return(false, balance)
            //Insufficient funds
        }
    }
    
    //MARK:-
    public func operate(entry : Entry, transaction : Transaction) ->(status : Bool, balance: Int){
        switch transaction {
        case .balance:
            return (true, balance)
        case .credit:
            if entry.credits > 0{
                balance = balance + entry.credits
                return (true, balance)
            }else{
                return(false, balance) //Cannot add 0 credits
            }
        case .debit:
            if balance - entry.credits >= 0{
                balance = balance - entry.credits
                return (true, balance)
            }else{
                return (false, balance)
                //Insufficent funds
            }
        default:
            break
        }
        return(false, 0)
    }
    
    
}
//MARK:-
public class Entry{
    public var credits : Int
    public var description : String = ""
    
    init(credits : Int, description : String? = "") {
        self.credits = credits
        self.description = description!
    }
}

class BankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
