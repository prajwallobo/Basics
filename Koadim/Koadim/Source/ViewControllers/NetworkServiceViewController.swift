//
//  ViewController.swift
//  Koadim
//
//  Created by Prajwal Lobo on 23/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

class NetworkServiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = User.current(){
            if let id = user.identifer{
                checkIfUserAvatarHasChanged(for: id) //User exists with valid auth token, check if avatar has changed
            }else if let auth = user.authToken{
                //Auth exists but not user prfile, get user profile with auth
                getUserProfile(with: auth)
            }
        }else{
            getAuthToken()
        }
    }
    //MARK:- API Service
   func getAuthToken(){
    APIService.shared.getAuthToken("email", "password") {[weak self] (success, error) in
        guard let ref =  self else {return}
        if success{ //Auth obtained
            if let auth = User.current()?.authToken{
                ref.getUserProfile(with: auth) //Get user profile since the auth exists
            }
        }else{
            print("Failed to get auth token")
        }
    }
    }
    
    func getUserProfile(with token : String){
        APIService.shared.getUserProfile(with: token) {[weak self] (user, error) in
            guard let ref = self else {return}
            if let error = error{
                //Handle error
                print(error.localizedDescription) //to silence the warning
            }else{
                if let user = user{
                    ref.checkIfUserAvatarHasChanged(for: user.identifer!)
                }
            }
        }
    }
    
    func checkIfUserAvatarHasChanged(for id : String){
        //Update user avatar if needed
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

