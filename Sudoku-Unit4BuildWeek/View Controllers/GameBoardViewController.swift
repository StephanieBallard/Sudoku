//
//  GameBoardViewController.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/25/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class GameBoardViewController: UIViewController {

    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberedButtonsCornerRadius()
    }
    
    @IBAction func oneButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func twoButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func threeButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func fourButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func fiveButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func sixButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func sevenButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func eightButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func nineButtonTapped(_ sender: UIButton) {
    }
    
    private func numberedButtonsCornerRadius() {
        for numberButton in numberButtons {
            numberButton.layer.cornerRadius = 7
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
