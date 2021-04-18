//
//  Questions.swift
//  SpiritAnimalQuiz
//
//  Created by Hanna Jung on 5/4/2564 BE.
//


import UIKit



struct Questions {
    
    var currentQuiz = 0
    
    var ani : animal?
    
    var picArray = [ #imageLiteral(resourceName: "flamingo"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "eagle"),#imageLiteral(resourceName: "dolphin"),#imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "rabbit"),#imageLiteral(resourceName: "turtle"),#imageLiteral(resourceName: "wolf") ]
    
    var animalArray = [ "Flamingo","Cat","Eagle","Dolphin","Dog","Rabbit","Turtle","Wolf"]
    
    var questionPath = [
        
        question(q : "Do you like being around big groups of people?",cd1 : 1, cd2: 6),
        question(q : "Do you like hot weather?",cd1 : 2, cd2: 3),
        question(q : "Good swimmer?",cd1 : 4, cd2: 3),
        question(q : "Has the same best friend for more than 3 years?",cd1 : 5, cd2: 40),
        question(q : "Like to dance and sing?",cd1 : 41, cd2: 40),
        question(q : "Are you protective of your family?",cd1 : 7, cd2: 40),
        question(q : "Bad at waking up in the morning?",cd1 : 9, cd2: 8),
        question(q : "Picky eater?",cd1 : 42, cd2: 43),
        question(q : "Generally a quiet person?",cd1 : 10, cd2: 44),
        question(q : "Like to play video games?",cd1 : 45, cd2: 11),
        question(q : "Enjoy trying new things?",cd1 : 46, cd2: 9),
        question(q : "Do you procrastinate work?",cd1 : 47, cd2: 44)
    ]
    
    // 40 = rabbit, 41 = Flamingo, 42 = Dolphin, 43 = Dog, 44 = wolf, 45 = cat, 46 = eagle, 47 = turtle
    
    mutating func nextQuestion(user: String) -> Int {
        
        if user == "Yes" {
            currentQuiz = questionPath[currentQuiz].choiceDestination1
            return currentQuiz
        } else {
            currentQuiz = questionPath[currentQuiz].choiceDestination2
            return currentQuiz
        }
    }
    
    
    mutating func animalChoose(quizNumInStruct: Int) {
        
        switch quizNumInStruct {
        case 40:
            ani = animal(animalPic: picArray[5], animalName: animalArray[5])
        case 41:
            ani = animal(animalPic: picArray[0], animalName: animalArray[0])
        case 42:
            ani = animal(animalPic: picArray[3], animalName: animalArray[3])
        case 43:
            ani = animal(animalPic: picArray[4], animalName: animalArray[4])
        case 44:
            ani = animal(animalPic: picArray[7], animalName: animalArray[7])
        case 45:
            ani = animal(animalPic: picArray[1], animalName: animalArray[1])
        case 46:
            ani = animal(animalPic: picArray[2], animalName: animalArray[2])
        case 47:
            ani = animal(animalPic: picArray[6], animalName: animalArray[6])
        default:
            print("Error")
        }
        
    }
    
    func getAnimalPic() -> UIImage {
        if let aniNonop = ani {
        return aniNonop.animalPic
        }
        return picArray[0]
    }
    
    func getAnimalName() -> String {
        return ani?.animalName ?? "nil"
    }
    
    
}

