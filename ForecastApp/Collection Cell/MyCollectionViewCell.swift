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
    }
    
    public func configure(with model: ViewController.Model) {
        self.timeLabel.text = String(model.time)
        self.image.kf.setImage(with: model.image)
        self.tempLabel.text = String(model.temp)
    }
}
