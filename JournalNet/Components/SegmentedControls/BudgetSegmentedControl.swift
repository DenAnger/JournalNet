//
//  BudgetSegmentedControl.swift
//  JournalNet
//
//  Created by Denis Abramov on 22.05.2024.
//

import SwiftUI

struct BudgetSegmentedControl: View {
	@Binding
	var selectedSegment: Int
	
	private let backgroundViewColor = ColorTheme.backgroundView
	private let backgroundCellColor = ColorTheme.backgroundCell
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	
	private let income = TextTheme.Budget.income
	private let expenses = TextTheme.Budget.expenses
	
	init(selectedSegment: Binding<Int>) {
		self._selectedSegment = selectedSegment
		
		UISegmentedControl.appearance().backgroundColor = backgroundCellColor
		UISegmentedControl.appearance().setTitleTextAttributes(
			[.foregroundColor: textColor, .font: UIFont.systemFont(ofSize: 15)],
			for: .normal
		)
		
		UISegmentedControl.appearance().selectedSegmentTintColor = backgroundViewColor
		UISegmentedControl.appearance().setTitleTextAttributes(
			[.foregroundColor: mainTextColor, .font: UIFont.systemFont(ofSize: 15)],
			for: .selected
		)
	}
	
	var body: some View {
		VStack {
			Picker("", selection: $selectedSegment) {
				Text(income).tag(0)
				Text(expenses).tag(1)
			}
			.pickerStyle(SegmentedPickerStyle())
			.frame(height: 50)
		}
	}
}

#Preview {
	BudgetSegmentedControl(selectedSegment: .constant(0))
}
