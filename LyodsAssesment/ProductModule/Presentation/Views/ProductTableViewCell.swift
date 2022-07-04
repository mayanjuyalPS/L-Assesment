//
//  ProductTableViewCell.swift
//  LyodsAssesment
//
//  Created by Mayank Juyal on 29/06/22.
//

import Foundation
import UIKit

class ProductTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    func configure(product: Product?) {
        titleLbl.text = product?.title
        descLbl.text = product?.description
        priceLbl.text = "$\(product?.price ?? 0)"
        productImageView.setImage(product?.thumbnail ?? "")
    }
    
}
