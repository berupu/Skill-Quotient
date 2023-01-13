//
//  TransactionsCell.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/13/23.
//

import SwiftUI

struct TransactionsCell: View {
    let amount: Amount
    let date: String
    let description: String
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(normalDateString(dateString:date))
                    .padding(.bottom)
                Text(description)
                Text("")
                
                
            }
            .padding()
            Spacer()
            Text("-$AmountType not corrct.00")
           
                .padding()
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        

    }
    
    func normalDateString(dateString:String) -> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        print("dateFormatter",dateFormatter.string(from: dateFormatter.date(from:  dateString) ?? Date()))
        
        let newD = dateFormatter.date(from:  dateString) ?? Date()
        
        //print("newD  \(new)")
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        print("rrrr normalDateString",dateFormatter.string(from: newD))
        
        return dateFormatter.string(from: newD)
        
    }

}
//
//struct TransactionsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionsCell()
//    }
//}
