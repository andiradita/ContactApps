//
//  ContactTableViewCell.swift
//  ContactApps
//
//  Created by Andi Radita on 22/04/21.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet var fullName : UILabel!
    @IBOutlet var userImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    static let identifier = "ContactTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "ContactTableViewCell", bundle: nil)
    }
    
    func configureData(with model: Contact) {
        self.fullName.text = model.name.first + " " + model.name.last
        let url = model.picture.large
        if let data = try? Data(contentsOf: URL(string: url)!) {
            self.userImage.image = UIImage(data: data)
        }
    }
    
}
