//
//  User.swift
//  Koadim
//
//  Created by Prajwal Lobo on 23/03/18.
//  Copyright © 2018 Prajwal Lobo. All rights reserved.
//

import UIKit

class User: NSObject {

    var identifer : String?
    var name : String?
    var email : String?
    
    public private(set) var authToken : String!
    
    required convenience init(coder aDecoder: NSCoder)
    {
        self.init()
        identifer       = aDecoder.decodeObject(forKey: "name") as? String
        name            = aDecoder.decodeObject(forKey: "name") as? String
        email           = aDecoder.decodeObject(forKey: "email") as? String
        authToken       = aDecoder.decodeObject(forKey: "auth") as? String
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.identifer, forKey: "identifer")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.authToken, forKey: "auth")
    }
    
    func setAuth(auth : String){
        authToken = auth
    }
    
    func archive(){
        NSKeyedArchiver.archiveRootObject(self, toFile: User.savePath())
        
    }
    
    class func savePath() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDirPath: String? = (paths.count > 0) ? paths.first! : nil
        var userDataSavePath: String? = nil
        
        if let path = docDirPath as NSString? {
            userDataSavePath = path.appendingPathComponent("user.kaodim")
        }
        
        return userDataSavePath!
    }
    class func current() -> User?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: User.savePath()) as? User
    }
}
