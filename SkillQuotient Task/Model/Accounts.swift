//
//  Accounts.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//

import Foundation

// MARK: - Accounts
struct Accounts: Codable {
    let accounts: [AccountInfo]?
}

// MARK: - AccountInfo
struct AccountInfo: Codable,Hashable {
    let accountNumber, accountBSB, accountLabel, currentBalance: String?
    let availableBalance: String?
    let transactions: String?

    enum CodingKeys: String, CodingKey {
        case accountNumber
        case accountBSB = "accountBsb"
        case accountLabel, currentBalance, availableBalance, transactions
    }
}
