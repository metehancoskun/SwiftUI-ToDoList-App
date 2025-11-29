//
//  ListViewModel.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import Foundation
import Combine
import SwiftUI


class ListViewModel:ObservableObject{
    @Published var items :[ItemModel] = []{
        
        didSet {
            
        }
    }
    
    
    
    
    let itemsKeys:String = "items_list"
    
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKeys),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
            else {return}
        self.items = savedItem
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet,to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title:String){
        let newItem =  ItemModel(title: title, isComplated: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletation()
        }
    }
    
    
    func saveItem(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKeys)
        }
    }
    
    
}
