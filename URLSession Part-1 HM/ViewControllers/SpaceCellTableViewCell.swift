//
//  SpaceCellTableViewCell.swift
//  URLSession Part-1 HM
//
//  Created by Dinar on 15.03.2023.
//

import UIKit

class SpaceCellTableViewCell: UITableViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dataLabel: UILabel!
    
    func configur(with dataSpace: Photo){
        nameLabel.text = dataSpace.imgSrc
        dataLabel.text = dataSpace.earthDate
    }

}
