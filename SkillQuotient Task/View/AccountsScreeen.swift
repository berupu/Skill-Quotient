//
//  AccountsScreeen.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/13/23.
//

import SwiftUI

struct AccountsScreeen: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var accountVM = AccountsVM()
    let accountNumber: String
    let availableBalance: String
    let currentBalance: String
    let tracsactionLink: String
    
    
    var body: some View {
            VStack(alignment: .leading) {
                Summarycell(accountNumber: accountNumber, availableBalance: availableBalance, currentBalance: currentBalance)
                    .padding(.bottom)
                //TransactionsCell()
                ScrollView(.vertical){
                    ForEach(accountVM.tracsaction?.transactions ?? [], id: \.self) { i in
                        VStack{
                            TransactionsCell(amount: i.amount, date: i.date, description: i.description)
                        }
                    }
                }

                
            }
            .onAppear{
                accountVM.getTransactions(url: tracsactionLink)
            }
        .navigationTitle("Accounts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "text.alignright")
                        .foregroundColor(.black)
                })
                
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                })
                
            }
        }

    }
}

//struct AccountsScreeen_Previews: PreviewProvider {
//    static var previews: some View {
//        AccountsScreeen()
//    }
//}
