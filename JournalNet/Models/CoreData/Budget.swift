//
//  Budget.swift
//  JournalNet
//
//  Created by Denis Abramov on 24.05.2024.
//

import Foundation
import SwiftData

@Model
final class Budget {
	var budgetType: String
	var date: Date
	var title: String
	var sum: String
	
	init(budgetType: String, date: Date, title: String, sum: String) {
		self.budgetType = budgetType
		self.date = date
		self.title = title
		self.sum = sum
	}
}
