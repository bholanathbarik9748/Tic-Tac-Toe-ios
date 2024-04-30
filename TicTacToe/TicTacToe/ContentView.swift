//
//  ContentView.swift
//  TicTacToe
//
//  Created by Bholanath Barik on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var TicTac = TicTacModel();
    @State var isWin = "";
    
    var body: some View {
        VStack {
            Text(isWin == "" 
                 ? "TIC TAC TOE"
                 : isWin)
                .font(.system(size: 45, weight: .heavy))
            
            let col = Array(repeating: GridItem(), count: 3)
            
            LazyVGrid(columns: col, content: {
                ForEach(0..<9) {i in
                    Button {
                        TicTac.buttonTab(i: i)
                        isWin = TicTac.isWin();
                    }label: {
                        Text(TicTac.buttonLabel(i: i))
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .font(.system(size: 45, weight: .heavy))
                            .cornerRadius(20)
                    }
                }
            })
        }
        .padding()
        
        Button {
            TicTac.resetGame();
            isWin = "";
        }label: {
            Text("Reset Game")
                .frame(width: 300, height: 50)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(25)
                .font(.system(size: 20, weight: .medium))
        }
        .padding(.top)
    }
}

#Preview {
    ContentView()
}
