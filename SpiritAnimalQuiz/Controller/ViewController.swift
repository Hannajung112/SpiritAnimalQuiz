//
//  ViewController.swift
//  SpiritAnimalQuiz
//
//  Created by Hanna Jung on 5/4/2564 BE.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var Yes: UIButton!
    @IBOutlet weak var No: UIButton!
    
    var questionModel = Questions()
    var QuizNum = 0
    var player: AVAudioPlayer?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeQuestion()
        Yes.layer.cornerRadius = 10
        No.layer.cornerRadius = 10

    }

    @IBAction func PressedButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle

        QuizNum = questionModel.nextQuestion(user: userAnswer ?? "userAnswer is nil")
        
        playSound()
        
        switch QuizNum {
        case 40,41,42,43,44,45,46,47 :
            
            questionModel.animalChoose(quizNumInStruct: QuizNum)
            self.performSegue(withIdentifier: "toSecondView", sender: self)
            
            Question.text = questionModel.questionPath[0].text
            questionModel.currentQuiz = 0
            
        default:
            
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeQuestion), userInfo: nil, repeats: false)
        }
        
        print(QuizNum) // check numbers
         // check error
    }
    
    @objc func changeQuestion() {
        Question.text = questionModel.questionPath[QuizNum].text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.animalPictureChoose = questionModel.getAnimalPic()
            destinationVC.animalNameChoose = questionModel.getAnimalName()
            destinationVC.animalAOrAnChoose = questionModel.getThisIsAOrAn()
            
        }
        
    }
    
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "FASTPOP", withExtension: "WAV") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}


    
    
    
    


