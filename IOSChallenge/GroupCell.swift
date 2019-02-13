//
//  GroupCell.swift
//  IOSChallenge
//
//  Created by Puneet Bagga on 2019-02-12.
//  Copyright © 2019 Puneet Bagga. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class GroupCell: UICollectionViewCell {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var deleteButtonBackground: UIVisualEffectView!
    var delete: Bool = false
    var imageName: String! {
        didSet {
            deleteButtonBackground.layer.cornerRadius = deleteButtonBackground.bounds.width / 2.0
            deleteButtonBackground.layer.masksToBounds = true
            deleteButtonBackground.isHidden = !isEditing
        }
        
    }
    var isEditing: Bool = false {
        didSet {
            deleteButtonBackground.isHidden =  !isEditing
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        delete = true
    }
}
