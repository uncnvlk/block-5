//
//  AddQuestionViewController.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova on 10.01.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {
    
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var answer1: UITextField!
    @IBOutlet weak var answer2: UITextField!
    
    @IBOutlet weak var answer3: UITextField!
    
    @IBOutlet weak var answer4: UITextField!
    
    @IBOutlet weak var rightAnswer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addQuestion(_ sender: Any) {
        if question.text?.isEmpty ?? true || answer1.text?.isEmpty ?? true ||  answer2.text?.isEmpty ?? true || answer3.text?.isEmpty ?? true || answer4.text?.isEmpty ?? true || rightAnswer.text?.isEmpty ?? true {
            let allertController = UIAlertController(
                            title: "Ошибка!",
                            message: "Заполните все поля",
                            preferredStyle: .alert)
                        
                        let action = UIAlertAction(
                            title: "ОК",
                            style: .cancel)
                        
                        allertController.addAction(action)
                        self.present(allertController, animated: true)
            
        } else {
            if rightAnswer.text! == answer1.text! || rightAnswer.text! == answer2.text! || rightAnswer.text! == answer3.text! || rightAnswer.text! == answer4.text! {
                var item: Question! = Question(question: question.text!, ans1: answer1.text!, ans2: answer2.text!, ans3: answer3.text!, ans4: answer4.text!, rightAnsw: rightAnswer.text!)
                Game.shared.addQuestion(item)
                question.text = nil
                answer1.text = nil
                answer2.text = nil
                answer3.text = nil
                answer4.text = nil
                rightAnswer.text = nil
            } else {
                let allertController = UIAlertController(
                                title: "Ошибка!",
                                message: "Правильный ответ не совпадает ни с одним ответом",
                                preferredStyle: .alert)
                            
                            let action = UIAlertAction(
                                title: "ОК",
                                style: .cancel)
                            
                            allertController.addAction(action)
                            self.present(allertController, animated: true)
            }
        }
    }
    
    @IBAction func backToMenu(_ sender: Any) {
        let MainVC = R.Storyboard.Main.instantiateInitialViewController()
        MainVC?.modalPresentationStyle = .fullScreen
        self.present(MainVC!, animated: true)
    }
}
