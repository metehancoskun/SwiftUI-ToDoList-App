//
//  NoItemView.swift
//  To Do List
//
//  Created by Metehan on 29.11.2025.
//

import SwiftUI

struct NoItemView: View {
    @State var animate : Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items ")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(20)
                
                NavigationLink("Add Something",destination: AddView())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                    color: animate ? Color.accentColor.opacity(0.7): Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
            guard !animate else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(
                    Animation
                        .easeInOut(duration: 2.0)
                        .repeatForever()
                ) {
                    animate.toggle()
                }
            }
        }
}

#Preview {
    
    
    NavigationView{
        NoItemView()
    }
    
    
}
