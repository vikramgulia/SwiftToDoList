//
//  ToDoItem.swift
//  SwiftToDo
//
//  Created by vikram gulia on 9/28/14.
//  Copyright (c) 2014 vgulia. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var completed:Bool = false
    var name:String
    
    init(name:String) {
        self.name = name
    }
   
}
