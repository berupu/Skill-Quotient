//
//  AccountsVM.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//

import Foundation
class AccountsVM:ObservableObject {
    
    /// For big project i use custom network model and concurrency
    /// To quick purpose i used this
    ///
    ///
    
    
    @Published var accountInfo : [AccountInfo] = []
    @Published var tracsaction: Transaction?  = nil
  
    func getAccount(){
        
        //This is not the correct way to implemet a link. For quick purpose i used.
        //Usally i use custom network model.Which is a better way to implement link by not showing
        guard let url = URL(string: "https://www.mocky.io/v2/5abb1042350000580073a7ea") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let dataArray = try JSONDecoder().decode(Accounts.self, from: data)
                
                DispatchQueue.main.async {
                    self.accountInfo = dataArray.accounts ?? []
                    //self.packages = dataArray.result
                    print("Address removed \(self.accountInfo)")
                }
            }catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func getTransactions(url: String){
        print("RUPUURL \(url)")
        guard let url = URL(string: url) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let dataArray = try JSONDecoder().decode(Transaction.self, from: data)
                
                DispatchQueue.main.async {
                    self.tracsaction = dataArray
                    //self.packages = dataArray.result
                    print("tracsanction  \(self.tracsaction?.transactions?.first?.amount)")
                }
            }catch {
                print(error)
            }
        }
        task.resume()
    }
   
}
