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
	
	@State var budgetType: String = "Income"
	@State var title: String = ""
	@State var date: Date = .now
	@State var sum: String = ""
	
	@State
	private var selectedSegment = 0
	
	@FocusState
	private var isTextFieldFocused: Bool
	
	private let backgroundColor = ColorTheme.background
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				VStack(spacing: 16) {
					BudgetSegmentedControl(selectedSegment: $selectedSegment)
					
					TextFieldView(text: $title, placeholder: "Title")
					
					horizontalStack
					Spacer()
					AddButton(action: {
						saveNewEvent()
						dismiss()
					})
					.focused($isTextFieldFocused)
					.padding(.bottom, 10)
					.disabled(title.isEmpty || sum.isEmpty)
				}
				.padding(.top, 18)
				.padding(.horizontal, 16)
			}
			.onTapGesture {
				if isTextFieldFocused {
					isTextFieldFocused = false
				}
			}
			
			.navigationTitle("New budget")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension NewBudgetViewController {
	var horizontalStack: some View {
		HStack(spacing: 16) {
			DatePickerView(selectedDate: $date)
			TextFieldView(text: $sum, placeholder: "Sum")
				.keyboardType(.numberPad)
		}
	}
}

private extension NewBudgetViewController {
	var selectedBudgetType: String {
		
		if selectedSegment == 0 {
			return "Income"
		} else {
			return "Expenses"
		}
	}
	
	func saveNewEvent() {
		budgetType = selectedBudgetType
		let newBudget = Budget(
			budgetType: budgetType,
			date: date,
			title: title,
			sum: sum
		)
		modelContext.insert(newBudget)
	}
}

#Preview {
	NewBudgetViewController()
}
