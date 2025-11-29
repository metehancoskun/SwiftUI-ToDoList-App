//
//  AddView.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    @State var alertTitle = ""
    @State var showAlert:Bool = false
    
    
//  MARK: - Body
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Button("Add"){
                    saveButtonPressed()
                }
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(.horizontal)
                
                
            }
            .padding(15)
            .navigationTitle("Add an Item")
            .alert( isPresented: $showAlert, content: getAlert)
        }
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
                presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    
    
    
}

#Preview {
    NavigationView {
        AddView()
    }
}
