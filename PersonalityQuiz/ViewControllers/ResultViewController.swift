//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран

    @IBOutlet var matchIconL: UILabel!
    @IBOutlet var descriptionL: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let resultAnimal = animalDefinition(answersChosen: answersChosen)
        
        matchIconL.text = "Вы \(resultAnimal.0 ?? " ")!"
        descriptionL.text = resultAnimal.1
    }
}

// MARK: - Private Methods

extension ResultViewController {
    private func animalDefinition(answersChosen: [Answer]) -> (Character?, String?){
        var countDog = 0
        var countCat = 0
        var countRabbit = 0
        var countTurtle = 0
        var animalCount = [Animal: Int]()
        
        for answer in answersChosen {
            switch answer.animal {
            case .dog:
                countDog += 1
            case .cat:
                countCat += 1
            case .rabbit:
                countRabbit += 1
            case .turtle:
                countTurtle += 1
            }
        }
        
        animalCount = [
            .dog : countDog,
            .cat : countCat,
            .rabbit : countRabbit,
            .turtle : countTurtle
        ]
        
        let maxAnimal = animalCount.max { a, b in a.value < b.value }

        
        return(maxAnimal?.key.rawValue, maxAnimal?.key.definition)
    }
}
