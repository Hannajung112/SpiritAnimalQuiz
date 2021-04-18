//
//  QuestionStruct.swift
//  SpiritAnimalQuiz
//
//  Created by Hanna Jung on 5/4/2564 BE.
//

import UIKit

struct question {
    var text : String
    var choiceDestination1 : Int
    var choiceDestination2 : Int
    
    init (q: String, cd1: Int, cd2: Int) {
        self.text = q
        self.choiceDestination1 = cd1
        self.choiceDestination2 = cd2
    }
}

struct animal {
    var animalPic : UIImage
    var animalName : String
    var animalAAn : String
    
    init(animalPic: UIImage, animalName: String, animalAAn: String) {
        self.animalPic = animalPic
        self.animalName = animalName
        self.animalAAn = animalAAn
    }
}
