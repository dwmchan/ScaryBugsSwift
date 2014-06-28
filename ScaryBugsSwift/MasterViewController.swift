//
//  MasterViewController.swift
//  ScaryBugsSwift
//
//  Created by Donald Chan on 23/06/2014.
//  Copyright (c) 2014 Donald Chan. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var bugs = NSMutableArray()


//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()
//
//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
        self.tableView.delegate = self
        
        self.title = "Scary Bugs"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        if objects == nil {
//            objects = NSMutableArray()
//        }
//        objects.insertObject(NSDate.date(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // #pragma mark - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var detailController:DetailViewController = segue.destinationViewController as DetailViewController
        var bug:RWTScaryBugDoc = self.bugs.objectAtIndex(self.tableView.indexPathForSelectedRow().row) as RWTScaryBugDoc
        detailController.detailItem = bug
    }

    // #pragma mark - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bugs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyBasicCell") as UITableViewCell
        var bug:RWTScaryBugDoc = self.bugs[indexPath.row] as RWTScaryBugDoc

        cell.textLabel.text = bug.data.title
        cell.imageView.image = bug.thumbImage
        return cell
    }
    
    override func didMoveToParentViewController(parent: UIViewController!) {
        self.tableView.reloadData()
    }
    
    

//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            objects.removeObjectAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

