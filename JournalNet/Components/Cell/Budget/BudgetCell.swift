//
//  BudgetCell.swift
//  JournalNet
//
//  Created by Denis Abramov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct BudgetCell: View {
	
	@Environment(\.modelContext)
	private var modelContext

	var budget: Budget
	
	private let backgroundCellColor = ColorTheme.backgroundCell
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		VStack(spacing: 8) {
			firstLine
			Text(budget.title)
				.font(.custom(font, size: 16))
				.foregroundStyle(Color(mainTextColor))
				.lineLimit(3)

			Text(sumText)
				.font(.custom(font, size: 16))
				.foregroundStyle(sumColor)
		}
		.padding(20)
		.background(Color(backgroundCellColor))
		.clipShape(Constant.cornerRadius)
	}
}

extension BudgetCell {
	var firstLine: some View {
		HStack {
			Text(budget.date.formatted(.dateTime.day().month(.defaultDigits).year()))
				.font(.custom(font, size: 11))
				.foregroundStyle(Color(textColor))
			Spacer()
			DeleteBarButton(action: {
					modelContext.delete(budget)
					try? modelContext.save()
			})
		}
	}
	
	var sumColor: Color {
		switch budget.budgetType {
		case "Income":
			return .green
		case "Expenses":
			return .red
		default:
			return .clear
		}
	}
	
	var sumText: String {
		switch budget.budgetType {
		case "Income":
			return "+$\(budget.sum)"
		case "Expenses":
			return "-$\(budget.sum)"
		default:
			return budget.sum
		}
	}
}

#Preview {
	BudgetCell(budget: Budget(budgetType: "", date: .now, title: "", sum: ""))
}
