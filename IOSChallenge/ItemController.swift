//
//  ItemController.swift
//  IOSChallenge
//
//  Created by Puneet Bagga on 2019-02-13.
//  Copyright © 2019 Puneet Bagga. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ItemController: UIViewController {

    @IBAction func add(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Group", in: context)
        let menuEntity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        let newGroup = NSManagedObject(entity: entity!, insertInto: context)
        let newItem = NSManagedObject(entity: menuEntity!, insertInto: context)
        
        newItem.setValue(text.text, forKey: "groupName")
        
        do {
            try context.save()
        } catch {
            print("Failed Saving")
        }
    }
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
