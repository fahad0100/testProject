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

func loadData(context:NSManagedObjectContext) -> [WordsEntity]{
    
    var dataLoad:[WordsEntity] = []
    let request:NSFetchRequest<WordsEntity> = WordsEntity.fetchRequest()
    do {
         dataLoad = try context.fetch(request)
        return dataLoad
    }catch let error {
        print(error.localizedDescription)
    }

    return dataLoad
}


func setDate(context:NSManagedObjectContext,id:String,nameWord:String,meanWord:String,pronunciationWord:String,englishExample:String,arabicExample:String){

    
    DispatchQueue.global().sync {
        let newWord = WordsEntity(context: context)
        newWord.setValue(id, forKey: "id")
        newWord.setValue(nameWord, forKey: "nameWord")
        newWord.setValue(meanWord, forKey: "meanWord")
        newWord.setValue(pronunciationWord, forKey: "pronunciationWord")
        newWord.setValue(englishExample, forKey: "exampleEnglish")
        newWord.setValue(arabicExample, forKey: "exampleArabic")

        saveData(context: context)
    }
  
 
}


func deleteData(context:NSManagedObjectContext,user: WordsEntity) {

    context.delete(user)
         saveData(context: context)
    
  
}
