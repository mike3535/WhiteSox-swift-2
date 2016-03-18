//
//  MasterViewController.swift
//  WhiteSox
//
//  Created by Mike Rizza on 11/3/15.
//  Copyright (c) 2015 Mike Rizza. All rights reserved.
//

import UIKit

class PlayerListViewController: UITableViewController {

    var objects = [Player]()


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // self.navigationItem.leftBarButtonItem = self.editButtonItem()

        //let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        //self.navigationItem.rightBarButtonItem = addButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let object = objects[indexPath.row]
            (segue.destinationViewController as! PlayerDetailViewController).detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 

        let object = objects[indexPath.row]
        cell.textLabel!.text = "\(object.lastName) , \(object.firstName)"
        cell.detailTextLabel!.text = "\(object.number) | \(object.pos)"
        
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    //override func tableView(tableView: UITableView, commitEditingStyle editingStyle: /UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
      //  if editingStyle == .Delete {
        //    objects.removeAtIndex(indexPath.row)
        //    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     //   } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
       // }
   // }


}

