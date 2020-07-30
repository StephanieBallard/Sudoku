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
    var someArrayName = [GamePiece]()
    var testBoards: [[[Int]]] = []
    var sameNumbers = Dictionary<String, [(Int, Int)]>()
    
    init() {
        loadFromPersistentStore()
        generateGamePieces()
        getBrothers()
        
        for piece in gamePieces[0] {
            print("Brothers: \(piece.brothers)")
        }
        
        for (section, item) in gamePieces[0][1].brothers {
            print("Brothers: \(String(describing: gamePieces[section][item].number))")
        }

    }
    
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
        
        for y in 0...8 {
            for x in 0...8 {
                let first = testBoards.first!
                var gamePiece: GamePiece!
                if first[y][x] == 0 {
                    gamePiece = GamePiece(number: nil, y: y, x: x)
                } else {
                    gamePiece = GamePiece(number: String(first[y][x]), y: y, x: x)
                }
                switch gamePiece.number {
                case "1":
                    sameNumbers["1", default: []].append((gamePiece.y, gamePiece.x))
                case "2":
                    sameNumbers["2", default: []].append((gamePiece.y, gamePiece.x))
                case "3":
                    sameNumbers["3", default: []].append((gamePiece.y, gamePiece.x))
                case "4":
                    sameNumbers["4", default: []].append((gamePiece.y, gamePiece.x))
                case "5":
                    sameNumbers["5", default: []].append((gamePiece.y, gamePiece.x))
                case "6":
                    sameNumbers["6", default: []].append((gamePiece.y, gamePiece.x))
                case "7":
                    sameNumbers["7", default: []].append((gamePiece.y, gamePiece.x))
                case "8":
                    sameNumbers["8", default: []].append((gamePiece.y, gamePiece.x))
                case "9":
                    sameNumbers["9", default: []].append((gamePiece.y, gamePiece.x))
                default:
                    break
                }
                someArrayName.append(gamePiece)
            }
        }
        
        gamePieces = someArrayName.chunked(into: 9)
        //        printSudokuBoard(sudokuBoard: testBoards.first!, message: "Merp")
        print(gamePieces[0][0])
        print(gamePieces[0][8])
        print(gamePieces[8][0])
    }
    
    func getBrothers() {
        for y in 0...8 {
            for x in 0...8 {
                if let number = gamePieces[y][x].number {
                    gamePieces[y][x].brothers = sameNumbers[number] ?? []
                }
            }
        }
    }
    
    func selectedCell(indexPath: IndexPath, number: String) {
        let y = indexPath.section
        let x = indexPath.item
        if gamePieces[y][x].number == nil {
            gamePieces[y][x].number = number
        }
    }
}

