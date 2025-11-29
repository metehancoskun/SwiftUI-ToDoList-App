//
//  ListRowView.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            
            Text(item.title)
                .font(.title2)
            Spacer()
        }
        .padding(8)
    }
}

#Preview {
    
    
    var item1 = ItemModel(title: "bir", isComplated: false)
    var item2 = ItemModel(title: "iki", isComplated: true)
    
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
   
    
    
    //ListRowView(item: ItemModel(title: "bir", isComplated: false))
}
