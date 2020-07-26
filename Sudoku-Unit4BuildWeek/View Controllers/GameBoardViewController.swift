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
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem?.tintColor = .white

        numberedButtonsCornerRadius()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
   
    @IBAction func changeDifficultyButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
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
