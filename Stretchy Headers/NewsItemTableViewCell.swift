//
//  NewsItemTableViewCell.swift
//  Stretchy Headers
//
//  Created by Alex Lee on 2017-07-04.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class NewsItemTableViewCell: UITableViewCell {

    // MARK: properties
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                categoryLabel.text = item.category.toString()
                categoryLabel.textColor = item.category.toColor()
                headlineLabel.text = item.story
            }
            else {
                categoryLabel.text = nil
                headlineLabel.text = nil
            }
        }
    }
    
    
    // MARK: UITableViewCell
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
