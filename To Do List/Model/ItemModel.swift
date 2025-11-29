//
//  ItemModel.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import Foundation


struct ItemModel:Identifiable,Codable{
    var id:String
    var title:String
    var isCompleted:Bool
    
    init(id: String = UUID().uuidString,title:String,isComplated :Bool){
        self.id = id
        self.title = title
        self.isCompleted = isComplated
    }
    
    
    func updateCompletation() -> ItemModel{
        return ItemModel(id: id, title: title, isComplated: !isCompleted)
    }
    
}
