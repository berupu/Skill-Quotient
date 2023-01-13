//
//  Transaction.swift
//  SkillQuotient Task
//
//  Created by Ashraful Islam Rupu on 1/12/23.
//

import Foundation


struct Transaction: Codable {
    let accountNumber: String?
    let transactions: [TransactionInfo]?
}

struct TransactionInfo: Codable,Hashable {
    let transactionID: JSONNull?
    let date: String
    let cbTransactionTypeCode: JSONNull?
    let description: String
    let amount: Amount

    enum CodingKeys: String, CodingKey {
        case transactionID = "transactionId"
        case date, cbTransactionTypeCode, description, amount
    }
}

enum Amount: Codable,Hashable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Amount.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Amount"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
