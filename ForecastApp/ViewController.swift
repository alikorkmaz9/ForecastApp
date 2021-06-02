//
//  ViewController.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var models = [Model]()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for indexPath in 0...temperatures.count {
            models.append(Model(time: time[indexPath], image: image.kf.setImage(with: imageUrl[indexPath]), temp: Double(temperatures[indexPath])))
        }
        parse()
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}

//MARK: - Model
extension ViewController {
    struct Model {
        let time: String
        let image: UIImageView
        let temp: Double
        
        init(time: String, image: UIImageView, temp: Double) {
            self.time = time
            self.image = image
            self.temp = temp
        }
    }
}


//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}
