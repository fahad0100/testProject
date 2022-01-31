//
//  TabBarController.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/6/22.
//

import UIKit

class TabBarController: UITabBarController {

    var button = UIButton()
   weak var flatButton:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let items = tabBar.items else { return }
        items[0].title = "Home"
        items[1].title = "Challengs"
        self.tabBar.unselectedItemTintColor = UIColor.black
        self.tabBar.tintColor = .green
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "addImage"), for: .normal)
        button.frame =  CGRect(x: getSizeScreen()[0] / 2 - 25, y: getSizeScreen()[1] - 85, width: 50, height: 50)
        button.addTarget(self, action: #selector(actionButton) , for: .touchDown)
       
        self.view.addSubview(button)
        
        
    }


    
    @objc func actionButton(){
        DispatchQueue.global().sync {
            let storyBord = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBord.instantiateViewController(withIdentifier: "NewWordClass") as! NewWordClass
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                        self.button.frame =  CGRect(x: getSizeScreen()[0] / 2 - 25, y: getSizeScreen()[1] - 85, width: 50, height: 50)
    }
 
  
}
