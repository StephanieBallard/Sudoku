//
//  GameCollectionViewCell.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        
//        translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = -1
        self.layer.borderColor = UIColor.black.cgColor
        
        print(self.bounds.width)
        print(self.bounds.height)
    }
    
}
