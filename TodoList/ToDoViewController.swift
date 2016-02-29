//
//  ToDoViewController.swift
//  TodoList
//
//  Created by Jahan Cherian on 2/26/16.
//  Copyright © 2016 Jahan Cherian. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoItems = [String]()  //Array to store the items
    var userDefaults = NSUserDefaults.standardUserDefaults()    //Variable to store data into the device
    
    @IBOutlet weak var itemField: UITextField!  //Reference to the TextField where user will type the todoItem
    @IBOutlet weak var todoTable: UITableView!  //Reference to the TableView where the data will appear
    @IBOutlet weak var itemDialogContainer: UIView! //Reference to the View that contains the TextField and Enter button
    @IBAction func addItem(sender: AnyObject) {     //What to do when the + button is pressed
        itemDialogContainer.hidden = false  //Make the item dialog visible
        todoTable.userInteractionEnabled = false    //Don't allow user to click anywhere else
        todoTable.alpha = 0.2   //Fade the background
    }
    @IBAction func enterItem(sender: AnyObject) {   //What to do when the button in the itemDialogContainer is pressed
        itemDialogContainer.hidden = true   //Hide the dialog box again
        todoItems.append(itemField.text!)   //Add to our array
        todoTable.userInteractionEnabled = true //Reenable the interation for the table!
        userDefaults.setObject(todoItems, forKey: "todoItemsSaved") //Add data to memory with the identifier "todoItemsSaved"
        userDefaults.synchronize()
        todoTable.reloadData()  //Reload the table view to reflect the changes
        itemField.text = "" //Reset the itemDialogContainer text field to empty
        todoTable.alpha = 1 //Unfade
    }
    
    override func viewDidLoad() {   //This is the function that is called by the application automatically when "the app is launched"
        super.viewDidLoad()
        
        //IMPORTANT TO ALWAYS SET THE DELEGATE AND DATASOURCE OF THE TABLEVIEW TO THAT OF THE VIEWCONTROLLER THAT IS CONTROLLING IT
        //SO THAT IT CAN BE EDITED BY THIS VIEWCONTROLLER!
        todoTable.delegate = self
        todoTable.dataSource = self
        
        todoItems = userDefaults.objectForKey("todoItemsSaved") as! [String] //Make our array refresh from the memory of the system
        todoTable.reloadData()  //Reload table data to reflect any change when launching the app
        itemDialogContainer.hidden = true   //By default hide the itemDialogContainer
        
    }
    
    override func didReceiveMemoryWarning() {   //This can generally be ignored for beginings
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //UITableView function to tell the table how many rows to have
        return todoItems.count  //The table should have as many rows as elements in our array of todoitems
    }
    
    //This function is also a UITableView function to modify each cell of the table
    //Note that the cell identifier must be the same as the identifier given in the inspecter viwew of the Interface Builder!
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = todoTable.dequeueReusableCellWithIdentifier("todoCell", forIndexPath: indexPath) as UITableViewCell //Create a cell with identifier "todoCell"
        let todoCellLabel = todoItems[indexPath.row]
        cell.textLabel?.text = todoCellLabel    //Make the cell text be the item text
        return cell
    }
    
    //What to do when the user touches on the area outside the main view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        itemDialogContainer.hidden = true
        self.view.endEditing(true)
    }
    
    //Allow the user to modify the cell contents in the table
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //Allow the different editing styles!
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {    //Deleting!
            
            //Remove from both the array and from the device memory
            todoItems.removeAtIndex(indexPath.row)
            userDefaults.setObject(todoItems, forKey: "todoItemsSaved")
            userDefaults.synchronize()
            //Adds the animation of swiping and deleting and reloading the tableview
            todoTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
}

