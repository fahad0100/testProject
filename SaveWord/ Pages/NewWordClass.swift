//
//  NewWordClass.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/1/22.
//

import UIKit
import CoreData
class NewWordClass: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var viewScroll: UIView!
    
    @IBOutlet weak var Scroll: UIScrollView!
    @IBOutlet weak var nameWordTextField: UITextField!
    @IBOutlet weak var meanWordTextField: UITextField!
    @IBOutlet weak var pronunciationWord: UITextField!
    @IBOutlet weak var englishExampleTextView: UITextView!
    @IBOutlet weak var topConstrent: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global(qos: .utility).async {
            DispatchQueue.main.async {
                self.changeTopConstrent()
                self.configure()
                self.hideKeyboardWhenTappedAround()
            }
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        }

      
    }



    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.async  {
            self.nameWordTextField.BorderDesign()
            self.nameWordTextField.ShdowDesign()
            
            self.meanWordTextField.BorderDesign()
            self.meanWordTextField.ShdowDesign()
            
            self.pronunciationWord.BorderDesign()
            self.pronunciationWord.ShdowDesign()
            
            self.englishExampleTextView.BorderDesign()
            self.englishExampleTextView.ShdowDesign()

        
        }
    }
    
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeTopConstrent()
    }
  
    
    @IBAction func addAction(_ sender: Any) {
        addNewWord()
     

   
    }
    

    
    
    @IBAction func cancelView(_ sender: Any) {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            
        }
    }
    
}
extension NewWordClass:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if englishExampleTextView.isFirstResponder {
        if englishExampleTextView.text == "English example" {
            englishExampleTextView.textColor = .black
            englishExampleTextView.text = ""
            }
        }
  
        
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if englishExampleTextView.text == "" {
            englishExampleTextView.text = "English example"
            englishExampleTextView.textColor = .gray
        }

  
    }
}

extension UITextField {
    func BorderDesign(){
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.2
       
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    func ShdowDesign(){
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 1.0
        self.backgroundColor = .white
        self.borderStyle = .none
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
}

extension UITextView {
    func BorderDesign(){
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.2
       
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    func ShdowDesign(){
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 1.0
        self.backgroundColor = .white

        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}




// MARK: - Functiuon

extension NewWordClass {
    func changeTopConstrent(){
            self.topConstrent.constant = 50
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.Scroll.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        Scroll.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        Scroll.contentInset = contentInset
    }
    
    func configure(){
        
        
        englishExampleTextView.delegate = self
        englishExampleTextView.textColor = .gray
        englishExampleTextView.text = "English example"


    }
    
    func addNewWord(){
         let id = "\(UUID().uuidString)"
        guard  nameWordTextField.text != "" else {return }
        guard  meanWordTextField.text != "" else {return }
        guard  pronunciationWord.text != "" else {return }
        guard  englishExampleTextView.text != "" else {return }

        
        
        guard let nameWord = nameWordTextField.text else {return }
        guard let meanWord = meanWordTextField.text else {return }
        guard let pronunciationWord = pronunciationWord.text else {return }
        guard let englishExample = englishExampleTextView.text else {return }
        
        DispatchQueue.global(qos: .utility).async {
            setDate(context: self.context, id: id, nameWord: nameWord, meanWord: meanWord, pronunciationWord: pronunciationWord, englishExample: englishExample)
        }

        
        dismiss(animated: true, completion: nil)

        
    }
}
