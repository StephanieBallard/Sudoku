//
//  GameController.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class GameController {
    
    var gamePieces = [[GamePiece]]()
    var testBoards: [[[Int]]] = []
    
    init() {
        loadFromPersistentStore()
        generateGamePieces()
        
//        for board in testBoards {
//            printSudokuBoard(sudokuBoard: board, message: "\nDecoded Boards\n")
//        }

    }
    
//    func printSudokuBoard(sudokuBoard: [[Int]], message: String) {
//        print(message)
//        for list in sudokuBoard {
//            print(list)
//        }
//    }
    
    func loadFromPersistentStore() {
        if let path = Bundle.main.path(forResource: "Sudoku", ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let boards = try PropertyListDecoder().decode([[[Int]]].self, from: data)
                testBoards = boards
            } catch {
                print("Error loading boards from plist file in bundle: \(error).")
            }
        }
    }
    
    func generateGamePieces() {
        var someArrayName = [GamePiece]()
//        var gamePieces = [[GamePiece]]()
        for y in 0...8 {
            for x in 0...8 {
                let first = testBoards.first!
                let gamePiece = GamePiece(number: String(first[y][x]), x: x, y: y)
                someArrayName.append(gamePiece)
            }
        }
        
        
        gamePieces = someArrayName.chunked(into: 9)
//        printSudokuBoard(sudokuBoard: testBoards.first!, message: "Merp")
        print(gamePieces[0][0])
        print(gamePieces[0][8])
        print(gamePieces[8][0])
    }
}

