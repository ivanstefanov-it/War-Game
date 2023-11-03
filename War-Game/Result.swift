//
//  Result.swift
//  War Card Game
//
//  Created by ivan.stefanov on 2.11.23.
//

import SwiftUI

struct Result: View {
    
    @Binding var playerWins: Int
    @Binding var cpuWins: Int
    
    var body: some View {
        NavigationView{
            
            ZStack{
                
                Image("background-plain")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    Text("The result is:").bold()
                    Text("\(playerWins) Wins for player").bold()
                    Text("\(cpuWins) Wins for cpu").bold()
                    
                    
                    
                    
                    NavigationLink(destination: ContentView()){
                        Text("Back to the game").frame(width: 200, height: 100).foregroundColor(.black).bold().font(.largeTitle).background(Color .gray).cornerRadius(150)
                    }
                }
                .foregroundColor(.white)
            }
            
            
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(playerWins: .constant(0), cpuWins: .constant(0))
    }
}
