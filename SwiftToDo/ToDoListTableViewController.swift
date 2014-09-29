//
//  ToDoListTableViewController.swift
//  SwiftToDo
//
//  Created by vikram gulia on 9/28/14.
//  Copyright (c) 2014 vgulia. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    //properties
    var toDoItems:[ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad")
        //loadInitialData()
    }
    
    func loadInitialData(){
        self.toDoItems = [
            ToDoItem(name:"Thanks"),
            ToDoItem(name:"XYZ"),
            ToDoItem(name:"ABC"),
            ToDoItem(name:"Swift"),
            ToDoItem(name:"Dinner")
            
        ]
    }
    
    // This lets another view (viewController?) revert back to this viewController, for like, going backwards or something. TODO: understand better.
    @IBAction func unwindToList(segue:UIStoryboardSegue) {
        
        var sourceController:AddToDoItemViewController = segue.sourceViewController as AddToDoItemViewController
        var item = sourceController.toDoItem
        var value:String = item.name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if(!value.isEmpty){
            self.toDoItems.append(item)
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        var toDoItem = self.toDoItems[indexPath.row]
        cell.textLabel?.text = toDoItem.name
        if(toDoItem.completed){
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */
    
    
    // Override to support clicking the table view.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath didSelectIndexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(didSelectIndexPath,animated: false)
        self.toDoItems[didSelectIndexPath.row].completed = !self.toDoItems[didSelectIndexPath.row].completed
        tableView.reloadRowsAtIndexPaths([didSelectIndexPath], withRowAnimation: .None)
    
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
