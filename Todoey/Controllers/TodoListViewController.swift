//
//  ViewController.swift
//  Todoey
//
//  Created by Adrian Cabrera on 31/08/2019.
//  Copyright © 2019 Adrian Cabrera. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let ITEM_KEY  = "TodoListArray"
    
    var itemArray: [Item] = []
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todos = ["Find Mike", "Buy Eggos", "Destroy Demogorgon" ]
        for title in todos {
            let newItem = Item()
            newItem.title = title
            newItem.done = Int.random(in: 0...2) % 2 == 0
            itemArray.append(newItem)
        }

        
        if let items = defaults.array(forKey: ITEM_KEY) as? [Item] {
            itemArray = items
        }
        
    }
    
    //MARK - Tableview DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.cellForRow(at: indexPath)?.accessoryType = itemArray[indexPath.row].done ? .checkmark : .none

//        self.tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let currentText = textField.text {
                
                let newItem = Item()
                newItem.title = currentText
                self.itemArray.append(newItem)
                
                self.defaults.set(self.itemArray, forKey: self.ITEM_KEY)
                
                self.tableView.reloadData()
            }
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        
        present(alert, animated: true, completion: nil)
    }
    
}

