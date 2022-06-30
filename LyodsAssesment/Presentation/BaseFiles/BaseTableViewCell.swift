//
//  BaseTableViewCell.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }

}
