//
//  ContactManager.swift
//  ContactApps
//
//  Created by Andi Radita on 22/04/21.
//

import Foundation

protocol ContactManagerDelegate {
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactData)
    func didFailWithError(error: Error)
}

struct ContactManager {
    let contactURL = "https://randomuser.me/api?results=5&exc=login,registered,id,nat&nat=us&noinfo"
    
    var delegate : ContactManagerDelegate?
    
    func fetchContact(){
        performRequest(with: contactURL)
    }
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let dataContact = self.parseJSON(safeData) {
                        self.delegate?.didUpdateContact(self, contact: dataContact)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ contactData : Data) -> ContactData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ContactData.self, from: contactData)
            return decodedData
        }catch {
            print(error)
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
