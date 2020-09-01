//
//  TableViewCell.swift
//  Api
//
//  Created by Vương Toàn Bắc on 8/31/20.
//  Copyright © 2020 VTB. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblMale: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func getData(data: User) {
        lblName.text = data.userName
        lblMale.text = data.gender
        lblAge.text = String(data.age)
        lblAdd.text = data.location
        URLSession.shared.dataTask(with: NSURL(string: data.image)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.avatar.image = image

            })
            
        }).resume()
    }
    
}
