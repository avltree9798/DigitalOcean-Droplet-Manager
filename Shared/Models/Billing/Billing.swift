//
//  Billing.swift
//  DigitalOcean Manager
//
//  Created by Anthony V on 7/28/21.
//

import Foundation

struct Billing: Codable {
    let monthToDateBalance, accountBalance, monthToDateUsage: String
    let generatedAt: Date

    enum CodingKeys: String, CodingKey {
        case monthToDateBalance = "month_to_date_balance"
        case accountBalance = "account_balance"
        case monthToDateUsage = "month_to_date_usage"
        case generatedAt = "generated_at"
    }
}

