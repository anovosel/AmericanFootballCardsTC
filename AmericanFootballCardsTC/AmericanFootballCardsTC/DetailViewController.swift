//
//  DetailViewController.swift
//  AmericanFootballCardsTC
//
//  Created by Antun Novosel on 10/10/15.
//  Copyright © 2015 Antun Novosel. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var schedule : NSArray?
    var cellIdentifier = "DetailCellIdentifier"

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        if "New England Patriots" == self.detailItem as! String {
            self.loadSchedule("Patriots")
        }
        
        if "Pittsburgh Steelers" == self.detailItem as! String {
            self.loadSchedule("Steelers")
        }

        if "Dallas Cowboys" == self.detailItem as! String {
            self.loadSchedule("Cowboys")
        }
        
        if "San Francisco 49ers" == self.detailItem as! String {
            self.loadSchedule("49ers")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.loadSchedule()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadSchedule(teamName : String) {
        var scheduleFromPlist : NSArray?
        
        if let path = NSBundle.mainBundle().pathForResource(teamName, ofType: "plist") {
            scheduleFromPlist = NSArray(contentsOfFile: path)
        }
        
        self.schedule = scheduleFromPlist
        self.navigationItem.title = teamName§
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.schedule?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = self.schedule?.objectAtIndex(section).valueForKey("Date")
        return sectionName as! String
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath)

        let team = self.schedule?.objectAtIndex(indexPath.section)
        
        cell.textLabel!.text = team?.valueForKey("Team") as! String
        cell.detailTextLabel!.text = team?.valueForKey("Time") as! String
        cell.imageView?.image = UIImage.init(named: team?.valueForKey("TeamImage") as! String)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
