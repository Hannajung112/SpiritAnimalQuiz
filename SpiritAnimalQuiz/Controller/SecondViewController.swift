//
//  SecondViewController.swift
//  SpiritAnimalQuiz
//
//  Created by Hanna Jung on 5/4/2564 BE.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var tryAgainbutton: UIButton!
    @IBOutlet weak var YouAreALabel: UILabel!
    
    var animalPictureChoose : UIImage?
    var animalNameChoose : String?
    var animalAOrAnChoose : String?
    var player: AVAudioPlayer?
    
    var questionStruct = Questions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tryAgainbutton.layer.cornerRadius = 30
        
        YouAreALabel.text = animalAOrAnChoose
        pictureView.image = animalPictureChoose
        animalLabel.text = animalNameChoose
    }
    

    @IBAction func tryAgainPressed(_ sender: UIButton) {
        
        playSound2()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func playSound2() {
        guard let url = Bundle.main.url(forResource: "POP4", withExtension: "WAV") else { return }

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
