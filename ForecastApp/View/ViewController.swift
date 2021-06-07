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
        setupNavBar()
        print(temperatures)
        modelAdd()
        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

    func modelAdd() {
        for indexPath in 0...temperatures.count-1 {
            models.append(Model(time: time[indexPath], image: imageUrl[indexPath], temp: Double(temperatures[indexPath])))
        }
    }
}

//MARK: - TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return day.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}

//MARK: - Navigation
extension ViewController {
    func setupNavBar () {
        title = cityName
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.label, NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1)]
        navigationController?.navigationBar.largeTitleTextAttributes = attrs
        
    }
}

