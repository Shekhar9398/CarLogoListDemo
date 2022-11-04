//
//  logoCarsCell.swift
//  LogoCarsTableView
//
//  Created by Shraddha Manwar on 06/07/22.
//

import UIKit

class logoCarsCell: UITableViewCell  {
    
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if isSelected {
            contentView.backgroundColor = .white
        }
    }
}
