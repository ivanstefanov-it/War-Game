//
//  ContentView.swift
//  War Card Game
//
//  Created by ivan.stefanov on 1.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card14"
    @State var cpuCard = "card14"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State var playerWins = 0
    @State var cpuWins = 0
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            
        ZStack{
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                
                Spacer()
                
                Button{
                    deal()
                } label: {
                    Image("button")
                }
                
                Spacer()
                
                HStack{
                    Spacer()
                    
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                
               Spacer()
                
               NavigationLink(destination: Result(playerWins: $playerWins, cpuWins: $cpuWins)){
               Text("Result").frame(width: 280, height: 50).foregroundColor(.white).bold().font(.largeTitle).background(Color .blue).cornerRadius(75)
                    }
                }
            }
        }
    }
    
    func deal(){
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        if playerCardValue > cpuCardValue{
            playerScore += 1
        }
        else if playerCardValue < cpuCardValue{
            cpuScore += 1
        }
        
        if playerScore == 10 {
            playerWins += 1
        }
        if cpuScore == 10{
            cpuWins += 1
        }
        
        if playerScore == 10 || cpuScore == 10{
            playerScore = 0
            cpuScore = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
