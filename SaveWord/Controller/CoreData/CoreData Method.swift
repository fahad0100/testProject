//
//  CoreData Method.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/15/22.
//

import Foundation
import UIKit
import CoreData

func saveData(context:NSManagedObjectContext){
    do {
        try context.save()
    }catch let error {
        print(error.localizedDescription)
    }
}

func loadData(complition:([WordsEntity])->()){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var dataLoad:[WordsEntity] = []
    let request:NSFetchRequest<WordsEntity> = WordsEntity.fetchRequest()
    do {
         dataLoad = try context.fetch(request)
        complition(dataLoad)
    }catch let error {
        print(error.localizedDescription)
        complition([])
    }
}


func setDate(context:NSManagedObjectContext,id:String,nameWord:String,meanWord:String,pronunciationWord:String,englishExample:String){

    
    DispatchQueue.global().sync {
        let newWord = WordsEntity(context: context)
        newWord.setValue(id, forKey: "id")
        newWord.setValue(nameWord, forKey: "nameWord")
        newWord.setValue(meanWord, forKey: "meanWord")
        newWord.setValue(pronunciationWord, forKey: "pronunciationWord")
        newWord.setValue(englishExample, forKey: "exampleEnglish")

        saveData(context: context)
    }
  
 
}


func deleteData(context:NSManagedObjectContext,user: WordsEntity) {

    context.delete(user)
         saveData(context: context)
    
  
}
