//
//  ChallengesPage.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/6/22.
//

import UIKit

class ChallengesPage: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var countTrue = 0
    var countFalse = 0
    
    
    var allWords : [WordsEntity] = []
    
    //    var question:Int?
    //    var answer1:Int?
    //    var answer2:Int?
    //    var answer3:Int?
    
    var questionArray:[Qusetion] = []
    
    @IBOutlet weak var countAnswer: UILabel!
    
    @IBOutlet weak var nameWord: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Update()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        loadData { allData in
            allWords = allData
            if allWords.count < 4 {
                print("add more then 4 word")
                
            }else{
                print("you can get challeng")
                changeWord()
     
            }
        }
        
        
        
    }
    @IBAction func answerOneAction(_ sender: Any) {
        
        if questionArray.last?.trueAnswer == (sender as AnyObject).titleLabel?.text {
            print("true")
            answerOne.backgroundColor = .green
            answerOne.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
        }else{
            print("true")
            answerOne.backgroundColor = .red
            answerOne.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
        }
    }
    @IBAction func answerTwoAction(_ sender: Any) {
        if questionArray.last?.trueAnswer == (sender as AnyObject).titleLabel?.text {
            print("true")
            answerTwo.backgroundColor = .green
            answerTwo.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
        }else{
            print("true")
            answerTwo.backgroundColor = .red
            answerTwo.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
        }
        
    }
    @IBAction func answerThreeAction(_ sender: Any) {
        if questionArray.last?.trueAnswer == (sender as AnyObject).titleLabel?.text {
            print("true")
            answerThree.backgroundColor = .green
            answerThree.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
            
        }else{
            print("true")
            answerThree.backgroundColor = .red
            answerThree.tintColor = .black
            var time = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
                
                if time == 1 {
                    self.changeWord()
                    
                }
                time += 1
            }
        }
    }
    @IBAction func changeWord(_ sender: Any) {
        changeWord()
    
    }
    
    func changeWord(){
        Update()
        let question = Int.random(in: 0..<allWords.count)
        var answer1 = Int.random(in: 0..<allWords.count)
        var answer2 = Int.random(in: 0..<allWords.count)
        let answer3 = question
    name: for _ in 0...100 {
        if question != answer1 && answer1 != answer2 && answer1 != answer3 {
            if question != answer2 && answer2 != answer1 && answer2 != answer3 {
                let setAnswer:Set<Int> = [answer1,answer2,answer3]
                var answer:[Int] = []
                    //write here you code
                for x in setAnswer {
             
                    answer.append(x)
                }
                    self.questionArray.append(Qusetion(qusetion: self.allWords[question].nameWord,
                                                       trueAnswer: self.allWords[question].meanWord,
                                                       answer1: self.allWords[answer[0]].meanWord,
                                                       answer2: self.allWords[answer[1]].meanWord,
                                                       answer3: self.allWords[answer[2]].meanWord,
                                                       answerDone: false))
                    self.nameWord.text = questionArray.last?.qusetion
                    self.answerOne.setTitle(questionArray.last?.answer1, for: .normal)
                    self.answerTwo.setTitle(questionArray.last?.answer2, for: .normal)
                    self.answerThree.setTitle(questionArray.last?.answer3, for: .normal)
                    break

            }else{
                answer2 = Int.random(in: 0..<self.allWords.count)
            }
        }else{
            answer1 = Int.random(in: 0..<self.allWords.count)
        }
    }
    }
        
        func Update(){
            
     
            DispatchQueue.main.async { [self] in
                answerOne.backgroundColor = .white
                answerOne.tintColor = .black
                answerTwo.backgroundColor = .white
                answerTwo.tintColor = .black
                answerThree.backgroundColor = .white
                answerThree.tintColor = .black
            }
            
        }
        
    }
    extension UIButton {
        func changeDesign(){
            self.layer.borderWidth = 1
            self.tintColor = .white
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.cornerRadius = 10
            self.backgroundColor = UIColor(named: "Color1")
            
        }
    }
    
    
    struct Qusetion {
        var qusetion:String?
        var trueAnswer:String?
        var answer1:String?
        var answer2:String?
        var answer3:String?
        var answerDone:Bool?
    }
