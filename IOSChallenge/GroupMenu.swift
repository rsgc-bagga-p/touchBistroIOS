//
//  GroupMenu.swift
//  IOSChallenge
//
//  Created by Puneet Bagga on 2019-02-12.
//  Copyright © 2019 Puneet Bagga. All rights reserved.
//

import UIKit
import CoreData
import Foundation

private let reuseIdentifier = "menuGroup"

class GroupMenu: UICollectionViewController {
    var managedObjectContext: NSManagedObjectContext!
    var groupItems = [Group]()
    @IBOutlet weak var addButton: UIBarButtonItem!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //@IBOutlet weak var edit: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.leftBarButtonItem = editButtonItem

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
        collectionView.reloadData()
    }
    
    func reload() {
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Group")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(fetchRequest) as! [Group]
            if (result != nil){
                groupItems = result
            }
        } catch {
            fatalError("Failed to fetch \(error)")
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return groupItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GroupCell
    
        // Configure the cell
        
        //cell.images.image = [indexPath.]
        if let groupName = groupItems[indexPath.row].value(forKey: "groupName") as? String {
            cell.name.text = groupName
        }
        if cell.delete == true {
            let group = groupItems[indexPath.row]
            let context = appDelegate.persistentContainer.viewContext
            context.delete(group)
            reload()
            collectionView.reloadData()
        }
        
        cell.layer.cornerRadius = 10
        //cell.cafeImage.frame = cell.bounds
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 0
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
    
        return cell
    }
    
    //delete
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        addButton.isEnabled = !editing
        if let indexPaths = collectionView?.indexPathsForVisibleItems {
            for indexPath in indexPaths {
                if let cell = collectionView.cellForItem(at: indexPath) as? GroupCell {
                    cell.isEditing = editing
                }
            }
        }
    }
    
    
    //move to menu items
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailedView = mainStoryBoard.instantiateViewController(withIdentifier: "menuItems") as! menuItems
        if let groupName = groupItems[indexPath.row].value(forKey: "groupName") as? String {
            detailedView.groupName = groupName
        }
        self.navigationController?.pushViewController(detailedView, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
