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
                animalCount.updateValue((animalCount[.dog] ?? 0) + 1, forKey: .dog)
            case .cat:
                animalCount.updateValue((animalCount[.cat] ?? 0) + 1, forKey: .cat)
            case .rabbit:
                animalCount.updateValue((animalCount[.rabbit] ?? 0) + 1, forKey: .rabbit)
            case .turtle:
                animalCount.updateValue((animalCount[.turtle] ?? 0) + 1, forKey: .turtle)
            }
        }
        
        let maxAnimal = animalCount.max { a, b in a.value < b.value }
        print (maxAnimal ?? " ")
        
        return(maxAnimal?.key.rawValue ?? " ", maxAnimal?.key.definition ?? " ")
    }
}
