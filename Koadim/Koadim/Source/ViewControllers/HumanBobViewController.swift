//
//  HumanBobViewController.swift
//  Koadim
//
//  Created by Prajwal Lobo on 24/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

class Pet {
    let name: String
    var owner : Human?
    init(name: String){
        self.name = name
    }
}

class Human {
    var name: String
    var pets: [Pet] = []
    var aPet = Pet(name: "")
    
    lazy var petNames:() -> String = {
        return ""
    }
    
    init(name: String){
        self.name = name
    }
    
    func adopt(pet: Pet){
        pets.append(pet)
    }
}

class HumanBobViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
