//
//  EntryTableViewCell.swift
//  Journal
//
//  Created by Carlos E. Alvarez-Berrios on 4/25/24.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        let formatter  = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .current
        formatter.timeStyle = .short
        
        guard let entry = entry else { return }
        
        titleLabel.text = entry.title
        timeStampLabel.text = formatter.string(from: entry.timeStamp!)
        bodyLabel.text = entry.bodyText
    }

}
