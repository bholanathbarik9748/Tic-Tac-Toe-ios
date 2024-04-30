//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Bholanath Barik on 29/04/24.
//

import Foundation

enum Player {
    case X
    case O
}

class TicTacModel: ObservableObject {
    @Published var board:[Player?] = Array(repeating: nil, count: 9);
    @Published var activePlayer:Player = .X;
    
    func buttonTab(i: Int){
        if(board[i] == nil && isWin() == ""){
            board[i] = activePlayer;
        }
        
        activePlayer = (activePlayer == .X) ? .O : .X;
    }
    
    func buttonLabel(i : Int) -> String {
        if let player = board[i] {
            return player == .X ? "X" : "O";
        }
        return "";
    }
    
    func isWin() -> String {
        // Rows
        if (board[0] == board[1] && board[1] == board[2]) && board[0] != nil {
            return board[0] == .X ? "X is the winner" : "O is the winner";
        }
        if (board[3] == board[4] && board[4] == board[5]) && board[3] != nil {
            return board[3] == .X ? "X is the winner" : "O is the winner";
        }
        if (board[6] == board[7] && board[7] == board[8]) && board[6] != nil {
            return board[6] == .X ? "X is the winner" : "O is the winner";
        }
        
        // Columns
        if (board[0] == board[3] && board[3] == board[6]) && board[0] != nil {
            return board[0] == .X ? "X is the winner" : "O is the winner";
        }
        if (board[1] == board[4] && board[4] == board[7]) && board[1] != nil {
            return board[1] == .X ? "X is the winner" : "O is the winner";
        }
        if (board[2] == board[5] && board[5] == board[8]) && board[2] != nil {
            return board[2] == .X ? "X is the winner" : "O is the winner";
        }
        
        // Diagonals
        if (board[0] == board[4] && board[4] == board[8]) && board[0] != nil {
            return board[0] == .X ? "X is the winner" : "O is the winner";
        }
        if (board[2] == board[4] && board[4] == board[6]) && board[2] != nil {
            return board[2] == .X ? "X is the winner" : "O is the winner";
        }
        
        if(
           board[0] != nil &&
           board[1] != nil &&
           board[2] != nil &&
           board[3] != nil &&
           board[4] != nil &&
           board[5] != nil &&
           board[6] != nil &&
           board[7] != nil &&
           board[8] != nil
        ){
            return "Draw Match";
        }
        return "";
    }

    
    func resetGame() {
        board = Array(repeating: nil, count: 9);
        activePlayer = .X;
    }
}
