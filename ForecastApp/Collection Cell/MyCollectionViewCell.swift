//
//  MyCollectionViewCell.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 2.06.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: ViewController.Model) {
        //self.timeLabel.text = model.time
        //self.image.image = UIImage(data: model.image)
        //self.tempLabel.text = String(model.temp)
    }
    

}
