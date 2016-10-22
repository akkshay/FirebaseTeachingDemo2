//
//  EventsDBUtils.swift
//  Events
//
//  Created by Akkshay Khoslaa on 10/22/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import Foundation
import Firebase
class EventsDBUtils {
    
    static func getEvents(withBlock: @escaping ([Event]) -> Void) {
        let dbRef = FIRDatabase.database().reference()
        dbRef.child("Events").observe(.value, with: { snapshot -> Void in
            if snapshot.exists() {
                var rEvents = [Event]()
                if let eventsDict = snapshot.value as? [String: AnyObject] {
                    for key in eventsDict.keys {
                        if let eventDict = eventsDict[key] as? [String: AnyObject] {
                            let retrievedEvent = Event(key: key, eventDict: eventDict)
                            rEvents.append(retrievedEvent)
                        }
                    }
                }
                withBlock(rEvents)
            }
            
        })
    }
    
    
}
