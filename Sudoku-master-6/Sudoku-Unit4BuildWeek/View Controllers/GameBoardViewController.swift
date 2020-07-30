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
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    
    let gameController = GameController()
    var timer: Timer?
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm : ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        timerLabel.text = dateFormatter.string(from: Date())
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.layer.cornerRadius = 3
        
        hidingNavigationBar()

        numberedButtonsCornerRadius()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.reloadData()
    }
    
    // MARK: - Number Button Actions -
    @IBAction func oneButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "1")
        collectionView.reloadData()
    }
    
    @IBAction func twoButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "2")
        collectionView.reloadData()
    }
    
    @IBAction func threeButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "3")
        collectionView.reloadData()
    }
    
    @IBAction func fourButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "4")
        collectionView.reloadData()
    }
    
    @IBAction func fiveButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "5")
        collectionView.reloadData()
    }
    
    @IBAction func sixButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "6")
        collectionView.reloadData()
    }
    
    @IBAction func sevenButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "7")
        collectionView.reloadData()
    }
    
    @IBAction func eightButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "8")
        collectionView.reloadData()
    }
    
    @IBAction func nineButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else { return }
        gameController.selectedCell(indexPath: indexPath, number: "9")
        collectionView.reloadData()
    }
   
    @IBAction func changeDifficultyButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Helper Methods -
    private func startTimer() {
//        timer = Timer(fireAt: Date(), interval: 1, target: self, selector: timerLabel, userInfo: nil, repeats: true)
    }

    
    private func updateTimer(timer: Timer) {
        
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
        return CGSize(width: (collectionView.bounds.width / 9) - 1, height: (collectionView.bounds.width / 9) + 1)
    }
}