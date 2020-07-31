//
//  GameBoardViewController.swift
//  Sudoku-Unit4BuildWeek
//
//  Created by Stephanie Ballard on 7/25/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit
import AVFoundation

class GameBoardViewController: UIViewController {
    
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    
    let gameController = GameController()
    var timer: Timer?
    var audioPlayer: AVAudioPlayer!
    var elapsedSeconds: Int = 0
    
        
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "mm : ss"
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }
    
    var indexPath: IndexPath? {
        didSet {
            print("Cells y: \(indexPath?.section), Cells x: \(indexPath?.item)")
        }
    }
    
    var selectedGamePiece: GamePiece? {
        didSet {
            print("Game Piece y: \(selectedGamePiece?.y), Game Piece x: \(selectedGamePiece?.x)")
            print("Game Piece number: \(selectedGamePiece?.number)")
        }
    }
    
    // MARK: - Life Cycle Functions -
    override func viewDidLoad() {
        super.viewDidLoad()
//        timer.invalidate()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        hidingNavigationBar()

        numberedButtonsCornerRadius()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.reloadData()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    // MARK: - Number Button Actions -
    @IBAction func oneButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "1")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func twoButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "2")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func threeButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "3")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func fourButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "4")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func fiveButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "5")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func sixButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "6")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func sevenButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "7")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func eightButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "8")
        collectionView.reloadData()
        checkFinished()
    }
    
    @IBAction func nineButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "9")
        collectionView.reloadData()
        checkFinished()
    }
   
    @IBAction func changeDifficultyButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Helper Methods -
//    @objc func fireTimer() {
//        elapsedSeconds += 1
//        let timerText = "\(elapsedSeconds/60) : \(elapsedSeconds % 60)"
//        self.timerLabel.text = timerText
//    }
    @objc
    func fireTimer() {
        elapsedSeconds += 1
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            if let self = self {
                self.elapsedSeconds += 1
                let timerText = "\(self.elapsedSeconds/60) : \(self.elapsedSeconds % 60)"
                self.timerLabel.text = timerText
            }
        }
    }
        
    private func checkFinished() {
        if gameController.isFilled() {
            
            playWinSound()
            let alert = UIAlertController(title: "YOU WON!", message: "Would you like to play again?", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.returnToFrontOfNavigationStack() }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

            self.present(alert, animated: true)
        }
    }
    
    @objc func returnToFrontOfNavigationStack() {
        navigationController?.popViewController(animated: true)
    }
    
    private func numberedButtonsCornerRadius() {
        for numberButton in numberButtons {
            numberButton.layer.cornerRadius = 7
        }
    }
    
    private func hidingNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    private func playWinSound() {
    let winSound = Bundle.main.path(forResource: "Ta Da-SoundBible.com-1884170640", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: winSound!))
        } catch {
            print(error)
        }
        
        audioPlayer.play()
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

// MARK: - Collection View Extensions -

extension GameBoardViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return gameController.gamePieces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameController.gamePieces[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as? GameCollectionViewCell else { return UICollectionViewCell() }
        
        let gamePiece = gameController.gamePieces[indexPath.section][indexPath.item]
        cell.gamePiece = gamePiece
        
        return cell
    }
}

extension GameBoardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.indexPath = indexPath
    }
}

extension GameBoardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 9) - 1, height: (collectionView.bounds.width / 9) - 1)
    }
}
