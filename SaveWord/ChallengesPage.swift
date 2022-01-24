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
    
    var question:Int?
    var answer1:Int?
    var answer2:Int?
    var answer3:Int?
    
    
    @IBOutlet weak var countAnswer: UILabel!
    
    @IBOutlet weak var nameWord: UILabel!
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allWords = loadData(context: context)

        countAnswer.text = "True:\(countTrue)|False:\(countFalse)"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countTrue = 0
        countFalse = 0
        allWords = loadData(context: context)
        answerOne.changeDesign()
        answerTwo.changeDesign()
        answerThree.changeDesign()
        changeWord()
        
        
    }
    @IBAction func answerOneAction(_ sender: Any) {
        if answerOne.titleLabel?.text == allWords[question!].meanWord{
            
            UIView.animate(withDuration: 5) {
                print("true")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.answerOne.backgroundColor = .green
                        self.countTrue += 1
                        self.changeWord()
                    }
                }
            }
        }else{
            
            UIView.animate(withDuration: 5) {
                print("false")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.answerOne.backgroundColor = .red
                        self.countFalse += 1
                        self.changeWord()
                    }
                }
        }
    }

    }
    @IBAction func answerTwoAction(_ sender: Any) {
        if answerTwo.titleLabel?.text == allWords[question!].meanWord{
            
            UIView.animate(withDuration: 5) {
                print("true")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.answerTwo.backgroundColor = .green
                        self.countTrue += 1
                        self.changeWord()
                    }
                }
            }
        }else{
            self.answerTwo.backgroundColor = .red
            UIView.animate(withDuration: 5) {
                print("false")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.countFalse += 1
                        self.changeWord()
                    }
                }
        }
    }

    }
    @IBAction func answerThreeAction(_ sender: Any) {
        if answerThree.titleLabel?.text == allWords[question!].meanWord{
            self.answerThree.backgroundColor = .green
            UIView.animate(withDuration: 5) {
                print("true")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.countTrue += 1
                        self.changeWord()
                    }
                }
            }
          
      
        }else{
            self.answerThree.backgroundColor = .red
            UIView.animate(withDuration: 5) {
                print("false")
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.countFalse += 1
                        self.changeWord()
                    }
                }
        }
    }
    }
    @IBAction func changeWord(_ sender: Any) {

//        changeWord()
    }
    
    func changeWord(){

        print(allWords[6].nameWord)
        
         answer1 = Int.random(in: 0..<allWords.count)
         answer2 = Int.random(in: 0..<allWords.count)
         answer3 = Int.random(in: 0..<allWords.count)
        print("answer1:\(answer1) | answer2:\(answer2) | answer3:\(answer3) | ")
        for _ in 0...1000{
            if answer1 != answer2 && answer1 != answer3 && answer2 != answer3{

                DispatchQueue.main.async {
                    self.Update(arrayAnaswer: [self.answer1!,self.answer2!,self.answer3!])
                }
                break
            }else{
                answer1 = Int.random(in: 0..<allWords.count)
                answer2 = Int.random(in: 0..<allWords.count)
                answer3 = Int.random(in: 0..<allWords.count)
            }
            
        }
    }
    
    
    
    
    
    func Update(arrayAnaswer:Array<Int>){

        DispatchQueue.main.async { [self] in
            countAnswer.text = "True:\(countTrue) False:\(countFalse)"
            self.answerOne.changeDesign()
            self.answerTwo.changeDesign()
            self.answerThree.changeDesign()
            
        }
         question = Int.random(in: 0..<arrayAnaswer.count)
         answer1 = Int.random(in: 0..<arrayAnaswer.count)
         answer2 = Int.random(in: 0..<arrayAnaswer.count)
         answer3 = Int.random(in: 0..<arrayAnaswer.count)
        nameWord.text =  allWords[question!].nameWord
        for _ in 0...1000{
            if answer1 != answer2 && answer1 != answer3 && answer2 != answer3{
                self.answerOne.setTitle(self.allWords[answer1!].meanWord, for: .normal)
                self.answerTwo.setTitle(self.allWords[answer2!].meanWord, for: .normal)
                self.answerThree.setTitle(self.allWords[answer3!].meanWord, for: .normal)
                break
            }else{
                answer1 = Int.random(in: 0..<arrayAnaswer.count)
                answer2 = Int.random(in: 0..<arrayAnaswer.count)
                answer3 = Int.random(in: 0..<arrayAnaswer.count)
            }
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
