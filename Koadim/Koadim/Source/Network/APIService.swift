//
//  APIService.swift
//  Koadim
//
//  Created by Prajwal Lobo on 23/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

class APIService: NSObject {
    
    static let shared = APIService()
    
    //MARK:- Get Auth
    func getAuthToken(_ email : String, _ password : String, withCompletionHandler handler : @escaping(Bool, Error?) -> Void){
        if let url = URL(string : "Your_Server_url"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            
            let session = URLSession.shared //Asynchronus
            session.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                if let error = error{
                    //Handle error
                    handler(false, error) //Something went wrong
                }
                else{
                    let user = User()
                    user.setAuth(auth: "authToken")
                    user.archive()
                    handler(true, nil) //Auth token obtained
                }
            })
        }
  
    }

    //MARK:- Get User profile
    func getUserProfile(with token : String, completionHandler handler : @escaping(User?, Error?) -> Void){
        if let url = URL(string : "Your_Server_url"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            
            let session = URLSession.shared //Asynchronus
            session.dataTask(with: urlRequest, completionHandler: { (data, urlResponse, error) in
                if let error = error{
                    //Handle error
                    handler(nil, error)
                }
                else{
                    let user = User()
                    user.name = "Kaodim" //get it from json
                    user.email = "name@kaodim.com"
                    user.setAuth(auth : token)
                    user.archive()
                }
            })
        }

    }

}
