//
//  Squad.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 3.08.2023.
//

import Foundation
class Persons : Decodable{
    var id:Int?
    var name:String?
    var position:String?
    var dateOfBirth:String?
    var nationality:String?
    
    init(id: Int, name: String, position: String, dateOfBirth: String, nationality: String) {
        self.id = id
        self.name = name
        self.position = position
        self.dateOfBirth = dateOfBirth
        self.nationality = nationality
    }
    
    init(){
        
    }
}
