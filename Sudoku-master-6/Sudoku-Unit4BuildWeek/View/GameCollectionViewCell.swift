//
//  GameCollectionViewCell.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gamePieceTextLabel: UILabel!
    
    var gamePiece: GamePiece? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        
//        print(self.bounds.width)
//        print(self.bounds.height)
    }
    
    private func updateViews() {
        guard let gamePiece = gamePiece else { return }
        gamePieceTextLabel.text = gamePiece.number
    }
    
}
