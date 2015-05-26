//
//  ViewController.swift
//  SwiftTableView-Example
//
//  Created by Sachin Nikumbh on 25/05/15.
//  Copyright (c) 2015 SN. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    // text to show on table cell
    var numberInWords: [String] = ["One","Two","Three","Four","Five","Six","Seven"];
    
    // images to show on table cell
    var numberInImages: [String] = ["img1", "img2", "img3","img4","img5","img6","img7"];
    
    // UItableView object
    @IBOutlet var objTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //UITableViewDataSource Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return numberInWords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "numberCell")
        cell.textLabel!.text = numberInWords[indexPath.row]
        var numberImage : UIImage = UIImage(named: numberInImages[indexPath.row])!
        cell.imageView!.image = numberImage
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            numberInWords.removeAtIndex(indexPath.row);
            numberInImages.removeAtIndex(indexPath.row);
            
            // you can reload table over here or you can delete partilcular row from table
            //            objTableView.reloadData();
            //or
            objTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}

