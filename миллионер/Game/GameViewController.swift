//
//  GameViewController.swift
//  миллионер
//
//  Created by Elizaveta Sidorenkova on 30.12.2021.
//

import UIKit

class GameViewController: UIViewController {

    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer1: UIButton!
    
    @IBOutlet weak var answer2: UIButton!
    
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var answer4: UIButton!

        
    var numberOfRound: Int = 0
    var Questions: [Question] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuestion()
        setQuestionOnScreen(round: numberOfRound)
    }
    
    private func setQuestion (){
        var item: Question! = Question(question: "Какой город стал столицей России в 1712 году?", ans1: "Москва", ans2: "Суздаль", ans3: "Хельсинки", ans4: "Санкт-Петербург", rightAnsw: "Санкт-Петербург")

        Questions.append(item)
        
        item.question = "Что изображено на гербе города Глазов?"
        item.ans1 = "глаз"
        item.ans2 = "ухо"
        item.ans3 = "нос"
        item.ans4 = "рот"
        item.rightAnsw = item.ans1


        Questions.append(item)
        
        item.question = "Название какой российской реки совпадает с именем бога из римской мифологии?"
        item.ans1 = "Енисей"
        item.ans2 = "Тобол"
        item.ans3 = "Амур"
        item.ans4 = "Дон"
        item.rightAnsw = item.ans3
        
        Questions.append(item)
        
        item.question = "Въезжающих в какой российский город встречает памятник, на котором можно прочесть слова «надежный товарищ»?"
        item.ans1 = "Ульяновск"
        item.ans2 = "Екатеринбург"
        item.ans3 = "Ростов-на-Дону"
        item.ans4 = "Тамбов"
        item.rightAnsw = item.ans4
        
        Questions.append(item)
    }
    
    func setQuestionOnScreen(round: Int) {
        question.text = Questions[round].question
        answer1.setTitle(Questions[round].ans1, for: .normal)
        answer2.setTitle(Questions[round].ans2, for: .normal)
        answer3.setTitle(Questions[round].ans3, for: .normal)
        answer4.setTitle(Questions[round].ans4, for: .normal)
        
    }
    
    func checkAnswer (ans: String) -> Bool{
        if ans == Questions[numberOfRound].rightAnsw {
            return true
        }
        else {
            return false
        }
    }
    
    func trueAns() {
        numberOfRound += 1
        
        
        if numberOfRound == Questions.count {
            let score = numberOfRound
            let result = Results(data: Date(), score: score)
            Game.shared.addResults(result)
            
            let MainVC = R.Storyboard.Main.instantiateInitialViewController()
            MainVC?.modalPresentationStyle = .fullScreen
            self.present(MainVC!, animated: true)
        } else {
            setQuestionOnScreen(round: numberOfRound)
        }
    }
    
    func falseAns() {
        let score = numberOfRound
        let result = Results(data: Date(), score: score)
        Game.shared.addResults(result)
        let MainVC = R.Storyboard.Main.instantiateInitialViewController()
        MainVC?.modalPresentationStyle = .fullScreen
        self.present(MainVC!, animated: true)
    }
    
    @IBAction func pressOnButton1(_ sender: Any) {
        if checkAnswer(ans: Questions[numberOfRound].ans1) == true {
            trueAns()
        } else {
            falseAns()
        }
    }
    
    @IBAction func pressOnButton2(_ sender: Any) {
        if checkAnswer(ans: Questions[numberOfRound].ans2) == true {
            trueAns()
        } else {
            falseAns()
        }
        
    }
    
    @IBAction func pressOnButton3(_ sender: Any) {
        if checkAnswer(ans: Questions[numberOfRound].ans3) == true {
            trueAns()
        } else {
            falseAns()
        }
    }
    
    @IBAction func pressOnButton4(_ sender: Any) {
        if checkAnswer(ans: Questions[numberOfRound].ans4) == true {
            trueAns()
        } else {
            falseAns()
        }
    }
}


