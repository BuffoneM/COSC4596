//
//  ViewController.swift
//  Lab1
//
//  Created by Michael Buffone on 2021-10-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet weak var randomNumberLabel: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var roundText: UILabel!
    
    var randomNum = 0;
    var scoreNum = 0;
    var roundNum = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Generate the random number and set the initial values of score and round
        generateRandomNumber()
        scoreText.text = "Score: \(scoreNum)";
        roundText.text = "Round: \(roundNum)";
    }
    
    func generateRandomNumber() {
        randomNum = Int.random(in: 1..<101);
        randomNumberLabel.text = "Put the Bull's Eye as close as you can to: \(randomNum)";
    }
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
        
        let sliderNum = Int(sliderValue.value);
        let goalCalc = abs(randomNum - sliderNum);
        let differenceCalc = 100 - goalCalc;
        
        generateRandomNumber()
        
        scoreNum += differenceCalc;
        scoreText.text = "Score: \(scoreNum)";
        
        roundNum += 1;
        roundText.text = "Round: \(roundNum)";
    }
    
    @IBAction func startOverButtonPressed(_ sender: UIButton) {
        // reset the slider button
        sliderValue.setValue(50, animated: true);
        generateRandomNumber()
        scoreNum = 0;
        roundNum = 1;
        scoreText.text = "Score: \(scoreNum)";
        roundText.text = "Round: \(roundNum)";
    }
}

