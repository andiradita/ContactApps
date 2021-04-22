//
//  ViewController.swift
//  ContactApps
//
//  Created by Andi Radita on 22/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var contactTable: UITableView!
    
    var contactManager = ContactManager()
    var contactData = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTable.register(ContactTableViewCell.nib(), forCellReuseIdentifier: ContactTableViewCell.identifier)
        contactTable.delegate = self
        contactTable.dataSource = self
        contactManager.delegate = self
    }

    @IBAction func addContactPressed(_ sender: UIBarButtonItem) {
        contactManager.fetchContact()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
        cell.configureData(with: contactData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController : ContactManagerDelegate {
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactData) {
        DispatchQueue.main.async {
            let data = contact.results
            self.contactData.append(contentsOf: data)
            self.contactTable.reloadData()
        }
    }
    
    func didFailWithError(error: Error){
        print(error)
    }
}

