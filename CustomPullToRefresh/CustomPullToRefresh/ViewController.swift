//
//  ViewController.swift
//  CustomPullToRefresh
//
//  Created by Samir ALILI on 24/10/2016.
//  Copyright © 2016 Samir ALILI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataArray: Array<String> = ["One", "Two", "Three", "Four", "Five"]
    
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tblDemo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDemo.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "idCell")
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.redColor()
        refreshControl.tintColor = UIColor.yellowColor()
        tblDemo.addSubview(refreshControl)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) 
        
        cell.textLabel!.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
}

