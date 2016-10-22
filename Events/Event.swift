//
//  Event.swift
//  Events
//
//  Created by Akkshay Khoslaa on 10/22/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import Foundation
import Firebase
class Event {
    
    var eventName: String?
    var posterId: String?
    var eventId: String?
    
    init(key: String, eventDict: [String: AnyObject]) {
        eventId = key
        if let id = eventDict["posterId"] as? String {
            posterId = id
        }
        if let name = eventDict["eventName"] as? String {
            eventName = name
        }
    }
    
    func getPoster(withBlock: @escaping (User) -> Void) {
        let dbRef = FIRDatabase.database().reference()
        dbRef.child("Users/\(posterId!)").observe(.value, with: { snapshot -> Void in
            if snapshot.exists() {
                if let userDict = snapshot.value as? [String: AnyObject] {
                    let poster = User(key: snapshot.key, userDict: userDict)
                    withBlock(poster)
                }
            }
        })
    }
    
    
}
