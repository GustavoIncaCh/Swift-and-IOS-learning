//
//  Enum.swift
//  CloneBank
//
//  Created by desarrollador11 on 7/06/22.
//

import SwiftUI

enum Enum: String, CaseIterable {
    case homeCase = "house"
    case billCase = "creditcard"
    case userCase = "person"
    case staticsCase = "lines.measurement.horizontal"
}

enum Payment: String, CaseIterable {
    case cards = "Cards"
    case account = "Account"
}

enum MenuStatics: String, CaseIterable {
    case income = "Income"
    case outcome = "Outcome"
}

enum MenuDate: String, CaseIterable{
    case MenuWeek = "Days"
    case MenuMonth = "Month"
    case MenuYear = "Year"
}
