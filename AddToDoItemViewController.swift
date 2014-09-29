//
//  AddToDoItemViewController.swift
//  SwiftToDo
//
//  Created by vikram gulia on 9/28/14.
//  Copyright (c) 2014 vgulia. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {

    var toDoItem:ToDoItem = ToDoItem(name: "")
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if((sender as UIBarButtonItem) != self.doneButton){
            return
        }
        
        if(!self.textField.text.isEmpty){
            self.toDoItem.name = self.textField.text
        }
    }


}
