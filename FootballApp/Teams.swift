//
//  Teams.swift
//  FootballApp
//
//  Created by Şenol Mert Duman on 2.08.2023.
//

import Foundation

class Teams : Decodable{
    var id:Int?
    var name:String?
    var crest:String?
    var venue:String?
    var squad:[Persons]?
    
    init(id: Int, name: String, crest: String, venue: String, squad: [Persons]) {
        self.id = id
        self.name = name
        self.crest = crest
        self.venue = venue
        self.squad = squad
    }
    init(){
        
    }
    

}
