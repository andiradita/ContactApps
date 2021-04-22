//
//  DetailViewController.swift
//  ContactApps
//
//  Created by Andi Radita on 22/04/21.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    
    var userName : String?
    var imageString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullName.text = userName
        let url = imageString!
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.imagePoster.image = UIImage(data: data)
        }
    }
}
