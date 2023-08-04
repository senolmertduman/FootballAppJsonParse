//
//  Competitions.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 2.08.2023.
//

import Foundation
class Competitions : Decodable{
    var id:Int?
    var name:String?
    var code:String?
    var emblem:String?
    
    init(id: Int, name: String, code: String, emblem: String) {
        self.id = id
        self.name = name
        self.code = code
        self.emblem = emblem
    }
    init(){
        
    }
}
