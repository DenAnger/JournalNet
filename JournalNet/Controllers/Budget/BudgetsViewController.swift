//
//  BudgetsViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 22.05.2024.
//

import SwiftUI
import SwiftData

struct BudgetsViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Query
	private var budgets: [Budget] = []
	
	@State
	private var selectedSegment = 0
	
	private let title = TextTheme.Title.budget
	private let backgroundColor = ColorTheme.background
	private let titleEmpty = TextTheme.Empty.Title.budget
	private let descriptionEmpty = TextTheme.Empty.Description.budget
	private let income = TextTheme.Budget.income
	private let expenses = TextTheme.Budget.expenses
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				firstView
			}
		}
	}
}

private extension BudgetsViewController {
	var firstView: some View {
		VStack(spacing: 16) {
			BudgetSegmentedControl(selectedSegment: $selectedSegment)
			
			if budgets.isEmpty {
				EmptyListView(
					title: titleEmpty,
					description: descriptionEmpty
				)
				.padding(.top, 124)
			} else {
				navigationStack
			}
			Spacer()
		}
		.toolbar{
			NavigationLink(
				destination: NewBudgetViewController(),
				label: {
					AddBarButton()
				}
			)
		}
		.navigationTitle(title)
		.navigationBarTitleDisplayMode(.large)
		.navigationBarTitleTextColor(.white)
	}
	
	var navigationStack: some View {
		ScrollView {
			LazyVGrid(
				columns: [GridItem(.flexible()), GridItem(.flexible())],
				spacing: 16
			) {
				ForEach(filteredBudgets, id: \.id) { budget in
					ZStack {
						BudgetCell(budget: budget)
					}
					.listRowBackground(Color(backgroundColor))
				}
			}
		}
		.padding()
		.background(Color(backgroundColor))
	}
}

private extension BudgetsViewController {
	var filteredBudgets: [Budget] {
		budgets.filter { budget in
			
			if selectedSegment == 0 {
				return budget.budgetType == income
			} else {
				return budget.budgetType == expenses
			}
		}
	}
}

#Preview {
	BudgetsViewController()
}
