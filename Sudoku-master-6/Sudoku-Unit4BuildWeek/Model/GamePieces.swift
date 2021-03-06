//
//  GamePieces.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct GamePiece {
    var number: String?
    var y: Int
    var x: Int
    var brothers: [(Int, Int)] = []
}
