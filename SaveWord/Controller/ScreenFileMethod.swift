//
//  ScreenFileMethod.swift
//  SaveWord
//
//  Created by Fahad Alazmi on 1/15/22.
//

import Foundation

import UIKit

func getSizeScreen()->[CGFloat]{
    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width
    let screenHeight = screenRect.size.height
    return [screenWidth,screenHeight]
}
