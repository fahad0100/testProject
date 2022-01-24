//
//  ClassB.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/22/22.
//

import UIKit

class ClassB: UIViewController {

    var data:[WordsEntity]?
    @IBOutlet weak var nameLabel: UILabel!
    let name = ClassA()
    override func viewDidLoad() {
        super.viewDidLoad()

        data = CardName.sharedInstance.cardName
        for x in 0..<data!.count {
            print(data![x].nameWord)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
