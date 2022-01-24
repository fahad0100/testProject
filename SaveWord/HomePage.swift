//
//  HomePage.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/6/22.
//

import UIKit

class HomePage: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var wordsArray:[WordsEntity] = []
    var index:Int?
    @IBOutlet weak var wordTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        wordTableView.dataSource = self
        wordTableView.delegate = self
    
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.wordsArray =  loadData(context: context)
    self.wordTableView.reloadData()
    }

}
extension HomePage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = wordTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HomeWordCell
        cell.wordName.text = wordsArray[indexPath.row].nameWord
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHadler in
            deleteData(context: self.context, user: self.wordsArray[indexPath.row])
            self.wordsArray.remove(at: indexPath.row)
            self.wordTableView.reloadData()
            completionHadler(true)
        }
       
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "moveDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveDetails" {
            let vc = segue.destination as! DetailsWordPage
            vc.wordDetails = wordsArray[index!]
            vc.modalPresentationStyle = .fullScreen
          
        }
    }
}
