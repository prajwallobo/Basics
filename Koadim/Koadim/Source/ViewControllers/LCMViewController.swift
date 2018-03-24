//
//  LCMViewController.swift
//  Koadim
//
//  Created by Prajwal Lobo on 24/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

class LCMViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Pass the array
        let result = lcm(arr: [2,5,10])
            print("LCM : \(result)")
        let result1 = lcm(arr: [2,0,7])
        print("LCM : \(result1)")
        
    }
    
    func lcm(arr : [Int]) -> Int{
        
        var result = arr.first
        for value in 1..<arr.count{
            let divisor = gcd(arr[value], result!)
            if divisor > 0{
                result = (arr[value] * result!) / divisor
            }else{
                print("Divide by zero error")
            }
            
        }
        return result!
    }
    //Find the GCD
    func gcd(_ a : Int, _ b:Int) -> Int{
        if b > 0{
            let rem = a % b
            if rem != 0{
                return gcd(b, rem)
            }else{
                return b
            }
        }else{
            print("Divide by zero error")
            return 0     }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
