
  File.swift
  Sudoku-Unit4BuildWeek

  Created by Stephanie Ballard on 7/27/20.
  Copyright © 2020 Stephanie Ballard. All rights reserved.


import Foundation
var sudokuBoards: [[[Int]]] = [easy, solutionEasy, medium, solutionMedium, hard, solutionHard]
var testBoards: [[[Int]]] = []
var sudokuURL: URL? {
    let fileManager = FileManager.default

    guard let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

    let boardURL = documentsDir.appendingPathComponent("Sudoku.plist")

    print("Sudoku URL: \(boardURL)")
    return boardURL
}
func saveToPersistentStore() {
    guard let sudokuURL = sudokuURL else { return }

    do {

        let encoder = PropertyListEncoder()

        let boardsData = try encoder.encode(sudokuBoards)

        try boardsData.write(to: sudokuURL)
    } catch {
        print("Error saving boards: \(error).")
    }
}
func loadFromPersistentStore() {
    do {

        guard let sudokuURL = sudokuURL else { return }

        let boardsData = try Data(contentsOf: sudokuURL)

        let decoder = PropertyListDecoder()

        let boards = try decoder.decode([[[Int]]].self, from: boardsData)

        testBoards = boards
    } catch {
        print("Error loading boards from plist: \(error).")
    }
}
saveToPersistentStore()
loadFromPersistentStore()
for board in testBoards {
    printSudokuBoard(sudokuBoard: board, message: "\nDecoded Boards\n")
}

import UIKit
var board = [[0,0,8,0,0,0,0,0,0],
             [4,9,0,1,5,7,0,0,2],
             [0,0,3,0,0,4,1,9,0],
             [1,8,5,0,6,0,0,2,0],
             [0,0,0,0,2,0,0,6,0],
             [9,6,0,4,0,5,3,0,0],
             [0,3,0,0,7,2,0,0,4],
             [0,4,9,0,3,0,0,5,7],
             [8,2,7,0,0,9,0,1,3]]
var easy = [[0,2,0,4,5,6,7,8,9],
            [4,5,7,0,8,0,2,3,6],
            [6,8,9,2,3,7,0,4,0],
            [0,0,5,3,6,2,9,7,4],
            [2,7,4,0,9,0,6,5,3],
            [3,9,6,5,7,4,8,0,0],
            [0,4,0,6,1,8,3,9,7],
            [7,6,1,0,4,0,5,2,8],
            [9,3,8,7,2,5,0,6,0]]
let solutionEasy = [[1,2,3,4,5,6,7,8,9],
                    [4,5,7,1,8,9,2,3,6],
                    [6,8,9,2,3,7,1,4,5],
                    [8,1,5,3,6,2,9,7,4],
                    [2,7,4,8,9,1,6,5,3],
                    [3,9,6,5,7,4,8,1,2],
                    [5,4,2,6,1,8,3,9,7],
                    [7,6,1,9,4,3,5,2,8],
                    [9,3,8,7,2,5,4,6,1]]
var medium = [[0,0,7,8,0,3,5,0,0],
              [0,3,0,0,0,0,0,2,0],
              [0,0,0,6,0,9,0,0,0],
              [0,6,9,0,0,0,1,4,0],
              [3,0,0,0,4,0,0,0,7],
              [0,4,2,0,0,0,3,8,0],
              [0,0,0,9,0,7,0,0,0],
              [0,7,0,0,0,0,0,6,0],
              [0,0,4,5,0,1,9,0,0]]
let solutionMedium = [[4,9,7,8,2,3,5,1,6],
                      [8,3,6,4,1,5,7,2,9],
                      [5,2,1,6,7,9,4,3,8],
                      [7,6,9,3,5,8,1,4,2],
                      [3,5,8,1,4,2,6,9,7],
                      [1,4,2,7,9,6,3,8,5],
                      [6,1,3,9,8,7,2,5,4],
                      [9,7,5,2,3,4,8,6,1],
                      [2,8,4,5,6,1,9,7,3]]
var hard = [[0,0,0,6,0,0,0,0,0],
            [0,7,5,0,4,0,0,0,0],
            [0,0,0,0,0,8,9,1,0],
            [0,0,2,8,0,0,0,0,5],
            [6,0,3,0,0,0,1,0,2],
            [4,0,0,0,0,7,6,0,0],
            [0,3,1,4,0,0,0,0,0],
            [0,0,0,0,7,0,8,4,0],
            [0,0,0,0,0,1,0,0,0]]
let solutionHard = [[3,9,8,6,1,2,7,5,4],
                    [1,7,5,9,4,3,2,8,6],
                    [2,6,4,7,5,8,9,1,3],
                    [7,1,2,8,3,6,4,9,5],
                    [6,8,3,5,9,4,1,7,2],
                    [4,5,9,1,2,7,6,3,8],
                    [8,3,1,4,6,9,5,2,7],
                    [9,2,6,3,7,5,8,4,1],
                    [5,4,7,2,8,1,3,6,9]]
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
let columns = 9
let rows = 9
var spaces = [Int]()
var sudokuBoard = [[Int]]()
func createBoard() {
    for _ in 0..<columns {
        for _ in 0..<rows {
            spaces.append(0)
        }
    }
    sudokuBoard = spaces.chunked(into: 9)
}
createBoard()
func possibleMove(columns: Int, rows: Int, number: Int, sudokuBoard: [[Int]]) -> Bool {
    for index in 0...8 {
        if sudokuBoard[columns][index] == number {
            return false
        }
    }
    for index in 0...8 {
        if sudokuBoard[index][rows] == number {
            return false
        }
    }
    let yGrid = Int((columns / 3)) * 3
    let xGrid = Int((rows / 3)) * 3
    
    for y in 0...2 {
        for x in 0...2 {
            if sudokuBoard[yGrid + y][xGrid + x] == number {
                return false
            }
        }
    }
    return true
}
func printSudokuBoard(sudokuBoard: [[Int]], message: String) {
    print(message)
    for list in sudokuBoard {
        print(list)
    }
}
func solveBoard(sudokuBoard: inout [[Int]]) {
    for y in 0...8 {
        for x in 0...8 {
            if sudokuBoard[y][x] == 0 {
                for number in 1...9 {
                    if possibleMove(columns: y, rows: x, number: number, sudokuBoard: sudokuBoard) {
                        sudokuBoard[y][x] = number
                        solveBoard(sudokuBoard: &sudokuBoard)
                        sudokuBoard[y][x] = 0
                    }
                }
                return
            }
        }
    }
    printSudokuBoard(sudokuBoard: sudokuBoard, message: "\n\nSudoku Board Solved!\n\n")
}
printSudokuBoard(sudokuBoard: medium, message: "\n\nStarting Sudoku Board\n\n")
solveBoard(sudokuBoard: &medium)

func loadFromPersistentStore2(fileName: String) {
    if let path = Bundle.main.path(forResource: fileName, ofType: "plist") {
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
//saveToPersistentStore()
//loadFromPersistentStore()
loadFromPersistentStore2(fileName: "Sudoku")
for board in testBoards {
    printSudokuBoard(sudokuBoard: board, message: "\nDecoded Boards\n")
}
