//
//  NewEventViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI
import SwiftData

struct NewEventViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.dismiss)
	private var dismiss
	
	@State
	private var homeTeam = ""
	
	@State
	private var awayTeam = ""
	
	@State
	private var homeScore: Int?
	
	@State
	private var awayScore: Int?
	
	@State
	private var sport = ""
	
	@State
	private var location = ""
	
	@State
	private var date: Date = .now
	
	@FocusState
	private var isTextFieldFocused: Bool
	
	private let title = TextTheme.Title.newEvent
	private let backgroundColor = ColorTheme.background
	private let homeTeamPlaceholder = TextTheme.Placeholder.teamHome
	private let awayTeamPlaceholder = TextTheme.Placeholder.teamAway
	private let teamScorePlaceholder = TextTheme.Placeholder.teamScore
	private let subtitlePlaceholder = TextTheme.Placeholder.teamScore

	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				scrollView
			}
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

extension NewEventViewController {
	var scrollView: some View {
		ScrollView {
			VStack(spacing: 16) {
				firstLine
				secondLine
				CarouselView(selectedSport: $sport)
				verticalStack
				
				DatePickerView(selectedDate: $date)
				
				Spacer()
				AddButton(action: {
					saveNewEvent()
					dismiss()
				})
				.padding(.bottom, 10)
				.disabled(
					homeTeam.isEmpty ||
					awayTeam.isEmpty ||
					homeScore == nil ||
					awayScore == nil ||
					sport.isEmpty ||
					location.isEmpty
				)
			}
			.focused($isTextFieldFocused)
			.padding(.top, 18)
			.padding(.horizontal, 16)
			.ignoresSafeArea(.keyboard)
		}
	}
	
	var firstLine: some View {
		HStack(spacing: 16) {
			TextFieldView(text: $homeTeam, placeholder: homeTeamPlaceholder)
			TextFieldView(text: Binding(
				get: {
					self.homeScore != nil ? String(self.homeScore!) : ""
				},
				set: { newValue in
					
					if let value = Int(newValue) {
						self.homeScore = value
					}
				}
			), placeholder: teamScorePlaceholder)
			.keyboardType(.numberPad)
		}
	}
	
	var secondLine: some View {
		HStack(spacing: 16) {
			TextFieldView(text: $awayTeam, placeholder: awayTeamPlaceholder)
			TextFieldView(text: Binding(
				get: {
					self.awayScore != nil ? String(self.awayScore!) : ""
				},
				set: { newValue in
					if let value = Int(newValue) {
						self.awayScore = value
					}
				}
			), placeholder: teamScorePlaceholder)
			.keyboardType(.numberPad)
		}
	}
	
	var verticalStack: some View {
		VStack(spacing: 16) {
			TextFieldView(text: $location, placeholder: subtitlePlaceholder)
		}
	}
}

private extension NewEventViewController {
	func saveNewEvent() {
		let newEvent = Event(
			date: date,
			homeTeam: homeTeam,
			awayTeam: awayTeam,
			homeScore: homeScore ?? 0,
			awayScore: awayScore ?? 0,
			sport: sport,
			location: location
		)
		modelContext.insert(newEvent)
	}
}

#Preview {
	NewEventViewController()
		.modelContainer(for: Event.self, inMemory: true)
}
