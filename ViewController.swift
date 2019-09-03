//
//  ViewController.swift
//  bottomSearchExpandable
//
//  Created by prog on 9/3/19.
//  Copyright © 2019 prog. All rights reserved.
//

//
//  ViewController.swift
//  JKBottomSearchViewExample
//
//  Created by Jarosław Krajewski on 11/04/2018.
//  Copyright © 2018 Jarosław Krajewski. All rights reserved.
//

import UIKit
//import JKBottomSearchView
private let identifier = "cellIdentifier"

class ViewController: UIViewController {
    let images:[UIImage] = [#imageLiteral(resourceName: "girl_profile"),#imageLiteral(resourceName: "girl_profile"),#imageLiteral(resourceName: "girl_profile")]
    var searchView = JKBottomSearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImageView = UIImageView(image: #imageLiteral(resourceName: "girl_profile"))
        backgroundImageView.frame = view.frame
        view.addSubview(backgroundImageView)
        
        searchView.dataSource = self
        searchView.delegate = self
        
        searchView.placeholder = "What are you looking for?"
        searchView.searchBarStyle = .minimal
        searchView.tableView.backgroundColor = .clear
        searchView.contentView.layer.cornerRadius = 10
        searchView.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        
        let nib = UINib(nibName: "TableViewCell", bundle: .main)
        searchView.tableView.register(nib, forCellReuseIdentifier: identifier)
        view.addSubview(searchView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: JKBottomSearchDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TableViewCell
        
        cell.placeLabel.text = "Place \(indexPath.row)"
        cell.addressLabel.text = "Adress of this place"
        cell.backgroundColor = .clear
        
        let image = images[indexPath.row % images.count]
        cell.imageView?.image = image.withRenderingMode(.alwaysTemplate)
        cell.imageView?.tintColor = .white
        cell.circleView.backgroundColor = .red
        cell.circleView.layer.cornerRadius = cell.circleView.frame.width/2
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: JKBottomSearchViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

