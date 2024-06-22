//
//  NewBudgetViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import SwiftUI

struct NewBudgetViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.dismiss)
	private var dismiss
	
	@State
	private var budgetType = TextTheme.Budget.income
	
	@State
	private var titleTextField = ""
	
	@State
	private var date: Date = .now
	
	@State
	private var sum = ""
	
	@State
	private var selectedSegment = 0
	
	@FocusState
	private var isTextFieldFocused: Bool
	
	private let title = TextTheme.Title.newBudget
	private let backgroundColor = ColorTheme.background
	private let titlePlaceholder = TextTheme.Placeholder.title
	private let sumPlaceholder = TextTheme.Placeholder.sum
	private let income = TextTheme.Budget.income
	private let expenses = TextTheme.Budget.expenses
	
	var body: some View {
		NavigationStack {
			mainView
				.onTapGesture {
					if isTextFieldFocused {
						isTextFieldFocused = false
					}
				}
			
				.navigationTitle(title)
				.navigationBarTitleDisplayMode(.large)
				.navigationBarTitleTextColor(.white)
			
				.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension NewBudgetViewController {
	var mainView: some View {
		ZStack {
			Color(backgroundColor).ignoresSafeArea()
			VStack(spacing: 16) {
				BudgetSegmentedControl(selectedSegment: $selectedSegment)
				
				TextFieldView(text: $titleTextField, placeholder: titlePlaceholder)
				
				horizontalStack
				Spacer()
				AddButton(action: {
					saveNewEvent()
					dismiss()
				})
				.focused($isTextFieldFocused)
				.padding(.bottom, 10)
				.disabled(titleTextField.isEmpty || sum.isEmpty)
			}
			.padding(.top, 18)
			.padding(.horizontal, 16)
		}
	}
	
	var horizontalStack: some View {
		HStack(spacing: 16) {
			DatePickerView(selectedDate: $date)
			TextFieldView(text: $sum, placeholder: sumPlaceholder)
				.keyboardType(.numberPad)
		}
	}
}

private extension NewBudgetViewController {
	var selectedBudgetType: String {
		
		if selectedSegment == 0 {
			return income
		} else {
			return expenses
		}
	}
	
	func saveNewEvent() {
		budgetType = selectedBudgetType
		let newBudget = Budget(
			budgetType: budgetType,
			date: date,
			title: titleTextField,
			sum: sum
		)
		modelContext.insert(newBudget)
	}
}

#Preview {
	NewBudgetViewController()
}
