//
//  ListView.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemView()
            }else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("To Do List")
        .navigationBarItems(leading: EditButton()
                            , trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
