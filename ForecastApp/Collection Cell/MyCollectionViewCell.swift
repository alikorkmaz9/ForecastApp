//
//  MyCollectionViewCell.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 2.06.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with Model: Forecast) {
        
    }
    

}
