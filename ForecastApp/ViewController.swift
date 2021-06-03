//
//  ViewController.swift
//  ForecastApp
//
//  Created by Ali Korkmaz on 1.06.2021.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var models = [Model]()
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parse()
        modelAdd()
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        for i in 0...time.count-1 {
        }
    }
}

//MARK: - Model
extension ViewController {
    struct Model {
        let time: String
        let image: URL
        let temp: Double
        
        init(time: String, image: URL, temp: Double) {
            self.time = time
            self.image = image
            self.temp = temp
        }
    }
    
    func modelAdd() {
        for indexPath in 0...temperatures.count-1 {
            models.append(Model(time: time[indexPath], image: imageUrl[indexPath], temp: Double(temperatures[indexPath])))
        }
    }
}

//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

