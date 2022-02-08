//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var matchIconL: UILabel!
    @IBOutlet var descriptionL: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let resultAnimal = animalDefinition(answersChosen: answersChosen)
        
        matchIconL.text = "Вы \(resultAnimal.0)!"
        descriptionL.text = resultAnimal.1
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
}

// MARK: - Private Methods

extension ResultViewController {
    private func animalDefinition(answersChosen: [Answer]) -> (Character, String){
        var animalCount = [Animal: Int]()
        animalCount = [
            .dog : 0,
            .cat : 0,
            .rabbit : 0,
            .turtle : 0
        ]
        
        for answer in answersChosen {
            switch answer.animal {
            case .dog:
                animalCount[.dog] = animalCount[.dog] ?? 0 + 1
            case .cat:
                animalCount[.cat] = animalCount[.cat] ?? 0 + 1
            case .rabbit:
                animalCount[.rabbit] = animalCount[.rabbit] ?? 0 + 1
            case .turtle:
                animalCount[.turtle] =  animalCount[.turtle] ?? 0 + 1
            }
        }
        
        let maxAnimal = animalCount.max { a, b in a.value < b.value }
        
        return(maxAnimal?.key.rawValue ?? " ", maxAnimal?.key.definition ?? " ")
    }
}
