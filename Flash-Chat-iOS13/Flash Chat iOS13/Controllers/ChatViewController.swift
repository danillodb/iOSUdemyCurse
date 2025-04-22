//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    var messages: [Message] = [
        Message(sender: "a@b.com", body: "Hey!"),
        Message(sender: "c@d.com", body: "Hello..."),
        Message(sender: "a@b.com", body: "What's up?"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appTitle
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        //nibName = name of xib file
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let text = messageTextfield.text, let user = Auth.auth().currentUser?.email {
            let sent = sendMessage(message: text, from: user)
            print("Message sent: \(sent)")
            if sent {
                self.messageTextfield.text = ""
            }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func loadMessages() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField, descending: false)
            .addSnapshotListener { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.messages = []
                if let data = snapshot {
                    for document in data.documents {
                        print(document)
                        if let sender = document[Constants.FStore.senderField] as? String,
                           let body = document[Constants.FStore.bodyField] as? String {
                            let message = Message(sender: sender, body: body)
                            self.messages.append(message)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
            }
        }
    }
    
    func sendMessage(message: String, from sender: String) -> Bool {
        var isSent = false
        db.collection(Constants.FStore.collectionName)
            .addDocument(data: [
                Constants.FStore.senderField: sender,
                Constants.FStore.bodyField: message,
                Constants.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if error != nil {
                    print (error!.localizedDescription)
                    isSent = false
                } else {
                    isSent = true
                }
            }
        return isSent
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = messages[indexPath.row].body
        
        let isCurrentUser = messages[indexPath.row].sender == user?.email
        cell.meImageView.isHidden = !isCurrentUser
        cell.youImageView.isHidden = isCurrentUser
        if isCurrentUser {
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.purple)
            cell.messageBubleView.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
        } else {
            cell.messageLabel.textColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.messageBubleView.backgroundColor = UIColor(named: Constants.BrandColors.purple)
        }
        
        return cell
    }
}
