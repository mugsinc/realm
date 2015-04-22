//
//  ViewController.swift
//  Realm
//
//  Created by Mugunthan Balakrishnan on 21/04/15.
//  Copyright (c) 2015 230 Interactive. All rights reserved.
//

import UIKit
import Realm
import Parse

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var testParse: [PFObject] = []
    let persons = Person.allObjects().sortedResultsUsingProperty("foo", ascending: true)
    var tempnum = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        
        realmToParse()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(persons.count)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let index = UInt(indexPath.row)
        let pers = persons.objectAtIndex(index) as! Person
        //let pers: AnyObject! = persons.objectAtIndex(UInt(indexPath.row))
        persons.count
        
        cell.textLabel?.text = pers.foo
        
        return cell
        
    }
    
    
    
    //functions
    
    func parseToRealm(){
        //parse query
        var testQuery = PFQuery(className: "TestObject")
        
        //Realm
        
        
        testQuery.findObjectsInBackgroundWithBlock { (TestObject, error) -> Void in
            
            if error == nil{
                self.testParse = TestObject as! [PFObject]
                println("\(self.testParse.count)")
            }
            
            
            
            //realm saving
            let realm = RLMRealm.defaultRealm()
            
            
            realm.transactionWithBlock({ () -> Void in
                for testCategory in TestObject as! [PFObject]{
                    let personClass = Person()
                    personClass.foo = testCategory["foo"] as! String
                    realm.addObject(personClass)
                }
            })
            
            realm.beginWriteTransaction()
            realm.commitWriteTransaction()
            self.tableView.reloadData()
            
        }

    }
    
    
    
    func realmToParse(){
        
        //println(self.persons.count)
        
        var tempcount = 0
        for realmDB in self.persons{
            
            var indexRealm = persons.objectAtIndex(UInt(tempcount)) as! Person
            println("\(indexRealm.foo)")
            tempcount++
        }
        
        
    }
    
    
    
}

