//
//  Model.swift
//  TestProject
//
//  Created by Alex Kokovidis on 17/07/2023.
//

import UIKit

struct ListRowItem: Hashable {
    let image: UIImage
    let name: String
    let fullName: String
    
    init(image: UIImage,
         name: String,
         fullName: String) {
        
        self.image = image
        self.name = name
        self.fullName = fullName
    }
}
