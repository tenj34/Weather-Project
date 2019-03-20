//
//  ViewController.swift
//  project1
//
//  Created by Juan Tenezaca on 3/11/19.
//  Copyright © 2019 Juan Tenezaca. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fm = FileManager.default // This is a data type that lets us work with a file system and in case we need to look for more files
        let path = Bundle.main.resourcePath! // declares a constant called path that is set to the resource path of our apps bundle
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                 pictures.append(item)// this is a picture to load !
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

