//
//  SingletonClass.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/25/22.
//

import Foundation



class DataModel {
    
    static var shared = DataModel()
    
    private init () {}
    
    var wordsAll:[WordsEntity] = []
    
}
