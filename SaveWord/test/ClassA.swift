//
//  ClassA.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/22/22.
//

import UIKit

class ClassA: UIViewController {

    var name:String = "hi"
    static var sheardInstant = ClassA()
    override func viewDidLoad() {
        super.viewDidLoad()

   
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for x in 0...100000{
            if x == 9999 {
                name = "Salem"
                print("salem")
       
            }
        }
    }
    func returnName()->String{
        return name ?? "nil"
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
