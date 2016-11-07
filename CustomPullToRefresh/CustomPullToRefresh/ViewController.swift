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
    
    //var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tblDemo: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDemo.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "idCell")
       // refreshControl = UIRefreshControl()
        //refreshControl.backgroundColor = UIColor.red
        //refreshControl.tintColor = UIColor.yellow
        //tblDemo.addSubview(refreshControl)
        
        tblDemo.addPullToRefresh(PullToMakeSoup(at: .top))  {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.tblDemo.endRefreshing(at: .top)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) 
        
        cell.textLabel!.text = dataArray[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

