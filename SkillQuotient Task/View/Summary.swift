//
//  Summary.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//

import SwiftUI

struct Summary: View {
    @StateObject var accountVM = AccountsVM()
    @State var goToAccount = false
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView{
            ZStack{
                
                
                ScrollView(.vertical){
                    VStack{
                        ForEach(Array(accountVM.accountInfo.enumerated()), id: \.offset) { index, i in
                            //ForEach(accountVM.accountInfo, id: \.self) { i in
                            Summarycell(accountNumber: accountVM.accountInfo[index].accountNumber ?? "", availableBalance: accountVM.accountInfo[index].availableBalance ?? "", currentBalance: accountVM.accountInfo[index].currentBalance ?? "")
                            //.frame(width: getScreen().height - 100,height: 100)
                                .padding()
                                .onTapGesture {
                                    // accountVM.getTransactions(url: i.transactions?.replacingOccurrences(of: "http", with: "https") ?? "")
                                    goToAccount.toggle()
                                    selectedIndex = index
                                    print("index: \(index)")
                                }
                                .fullScreenCover(isPresented: $goToAccount) {
                                    
                                    NavigationView{
                                        AccountsScreeen(accountNumber: accountVM.accountInfo[selectedIndex].accountNumber ?? "", availableBalance: accountVM.accountInfo[selectedIndex].availableBalance ?? "", currentBalance: accountVM.accountInfo[selectedIndex].currentBalance ?? "", tracsactionLink:  accountVM.accountInfo[selectedIndex].transactions?.replacingOccurrences(of: "http", with: "https") ?? "")
                                    }
                                }
                        }
                        
                        
                    }
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
            
            
            
        }
        
        .onAppear{
            accountVM.getAccount()
        }
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "text.alignright")
                        .foregroundColor(.black)
                })
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                })
                
            }
        }

    }
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary()
    }
}
