//
//  GroupController.swift
//  IOSChallenge
//
//  Created by Puneet Bagga on 2019-02-12.
//  Copyright © 2019 Puneet Bagga. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class GroupController: UIViewController {
    var managedObjectContext: NSManagedObjectContext!
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var text: UITextField!
    @IBAction func add(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Group", in: context)
        let newGroup = NSManagedObject(entity: entity!, insertInto: context)
        
        newGroup.setValue(text.text, forKey: "groupName")
        
        do {
            try context.save()
        } catch {
            print("Failed Saving")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.addGroup(sender: add)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
