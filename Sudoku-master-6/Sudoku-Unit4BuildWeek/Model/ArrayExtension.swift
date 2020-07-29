//
//  ArrayExtension.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/28/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
