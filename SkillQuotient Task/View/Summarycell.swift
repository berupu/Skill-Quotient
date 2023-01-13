//
//  Summarycell.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//

import SwiftUI

struct Summarycell: View {
    let accountNumber: String
    let availableBalance: String
    let currentBalance: String
    
    
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue.gradient.opacity(0.5))
                .frame(width: getScreen().width,height: getScreen().height * 0.2)
                .overlay(alignment: .bottom) {
                    HStack{
                        VStack(alignment: .leading){
                            
                            Text("On Call Savings")
                                .foregroundColor(.white)
                            Text(accountNumber)
                                .foregroundColor(.white)
                            HStack{
                                Text("$\(availableBalance)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .bold()
                                
                                
                                Text("Available")
                                    .foregroundColor(.white)
                            }
                            HStack{
                                Text("$\(currentBalance)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .bold()
                                
                                Text("Current")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        
                        Spacer()
                        Image(systemName: "arrow.right")
                            .padding()
                    }
                    .frame(width: getScreen().width,height: getScreen().height * 0.15)
                    .background(.gray.opacity(0.2))
                }
        }
        
    }
}


extension View {
    func getScreen() -> CGRect {
        UIScreen.main.bounds
    }
}
