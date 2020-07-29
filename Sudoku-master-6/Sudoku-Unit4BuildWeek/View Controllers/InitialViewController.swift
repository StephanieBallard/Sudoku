//
//  InitialViewController.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/25/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit
import AVFoundation

class InitialViewController: UIViewController {
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    
//        self.navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.barTintColor = .clear
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        playWinSound()
        difficultyButtonsCornerRadii()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func difficultyButtonsCornerRadii() {
        // MARK: - Rounded Buttons -
        easyButton.layer.cornerRadius = 20
        mediumButton.layer.cornerRadius = 20
        hardButton.layer.cornerRadius = 20
    }
    
    func playWinSound() {
        let winSound = Bundle.main.path(forResource: "Ta Da-SoundBible.com-1884170640", ofType: "mp3")
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: winSound!))
            } catch {
                print(error)
            }
        }

    @IBAction func easyButtonTapped(_ sender: UIButton) {
        audioPlayer.play()
    
    }
    @IBAction func mediumButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton) {
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
