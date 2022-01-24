//
//  WordClass.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/1/22.
//

import Foundation
import UIKit


struct WordStruct {
    var id:String
    var nameWord:String
    var meanWord:String
    var pronunciationWord:String
    var englishExample:String
    var arabicExample:String
    
    func getWordDictionary()->Dictionary<String,String>{
        let wordDictionary = ["ID":self.id,"nameWord":self.nameWord ,"meanWord":self.meanWord ,"pronunciationWord": self.pronunciationWord,"englishExample":self.englishExample ,"arabicExample": self.arabicExample]
        return wordDictionary 
    }
    
}
