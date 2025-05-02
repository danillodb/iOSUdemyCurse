//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    let saveDataKey = "TodoeyNewItemArray"
//    let defaults = UserDefaults.standard
//    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        .first?.appendingPathComponent("myData.plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemArray = [TodoItem]() //[TodoItem("Find a job"), TodoItem("Learn Swift"), TodoItem("Build a todo app")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        loadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //remove using CoreData
        //context.delete(itemArray[indexPath.row])
        //itemArray.remove(at: indexPath.row)
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
        saveData()
    }
    
    @IBAction func AddButtonClick(_ sender: UIBarButtonItem) {
        var textFieldItem = UITextField()
        let alertController = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Confirm", style: .default) { (action) in
            //print(alertController.textFields![0].text ?? "No item entered")
            if textFieldItem.text?.isEmpty == false, let textFieldText = textFieldItem.text {
                self.itemArray.append(self.createItem(text: textFieldText))
                self.saveData()
            }
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter item name here"
            textFieldItem = textField
        }
        alertController.addAction(actionButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func saveData() {
//        //using defaults
//        defaults.set(encodedData, forKey: saveDataKey)
//        //using custom plist
//        if let encodedData = try? JSONEncoder().encode(itemArray) {
//            do {
//                try encodedData.write(to: dataFilePath!)
//            } catch {
//                print("Error saving data: \(error)")
//            }
//        }
        //using CoreData
        do {
            try context.save()
        } catch {
            print("Save error \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
//        //using defaults
//        if let data = defaults.data(forKey: saveDataKey) {
//            if let decodedData = try? JSONDecoder().decode([TodoItem].self, from: data) {
//                itemArray = decodedData
//            }
//        }
//        //using custom plist
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            if let decodedData = try? JSONDecoder().decode([TodoItem].self, from: data) {
//                itemArray = decodedData
//            }
//        }
        //using CoreData
        let request: NSFetchRequest<TodoItem> = TodoItem.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Read error \(error)")
        }
    }
    
    func createItem(text: String) -> TodoItem {
        let newItem = TodoItem(context: context)
        newItem.title = text
        newItem.done = false
        return newItem
    }
}

//MARK: SearchBar
extension TodoListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard !text.isEmpty else {
            return true
        }
        
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        
        return trimmedText.count > 0
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
