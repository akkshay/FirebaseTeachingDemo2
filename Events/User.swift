//
//  User.swift
//  Events
//
//  Created by Akkshay Khoslaa on 10/22/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import Foundation
import Firebase

class User {
    
    var userId: String?
    var name: String?
    var profPicUrl: String?
    
    init(key: String, userDict: [String: AnyObject]) {
        userId = key
        if let username = userDict["name"] as? String {
            name = username
        }
        if let url = userDict["profPicUrl"] as? String {
            profPicUrl = url
        }
    }
    
    func getProfImage(withBlock: @escaping (UIImage) -> Void) {
        // Create a reference to the file you want to download
        let storageRef = FIRStorage.storage().reference()
        let imageRef = storageRef.child(profPicUrl!)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        imageRef.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                print("An error occurred while retrieving the profile image: \(error)")
            } else {
                let image = UIImage(data: data!)
                withBlock(image!)
            }
        }
    }

    
}
