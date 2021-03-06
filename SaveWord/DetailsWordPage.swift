//
//  DetailsWordPage.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/22/22.
//

import UIKit

class DetailsWordPage: UIViewController {

    
    
    var wordDetails:WordsEntity?
    
    
    @IBOutlet weak var nameWord: UILabel!
    @IBOutlet weak var meanWord: UILabel!
    @IBOutlet weak var pronounsWord: UILabel!

    
    @IBOutlet weak var enExample: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameWord.text = wordDetails?.nameWord
        meanWord.text = wordDetails?.meanWord
        pronounsWord.text = wordDetails?.pronunciationWord
        
        enExample.text = wordDetails?.exampleEnglish
        // Do any additional setup after loading the view.
    }
    


    
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
