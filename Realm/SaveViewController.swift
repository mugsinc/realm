//
//  SaveViewController.swift
//  Realm
//
//  Created by Mugunthan Balakrishnan on 21/04/15.
//  Copyright (c) 2015 230 Interactive. All rights reserved.
//

import UIKit
import Realm

class SaveViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    let persons = Person.allObjects().sortedResultsUsingProperty("foo", ascending: true)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButton(sender: AnyObject) {
        let author = Person()
        author.foo = nameTextField.text
       // author.id = Int(persons.count + 7)
        
        let realm = RLMRealm.defaultRealm()
        
        
        realm.beginWriteTransaction()
        realm.addObject(author)
        realm.commitWriteTransaction()
        self.dismissViewControllerAnimated(true, completion: nil)

        
    }

    @IBAction func cancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
