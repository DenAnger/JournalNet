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
	
	@State private var homeTeam: String = ""
	@State private var awayTeam: String = ""
	@State private var homeScore: Int?
	@State private var awayScore: Int?
	@State private var sport: String = ""
	@State private var location: String = ""
	@State private var date: Date = .now
	
	@FocusState private var isTextFieldFocused: Bool
	
	private let backgroundColor = ColorTheme.background
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
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
			.onTapGesture {
				if isTextFieldFocused {
					isTextFieldFocused = false
				}
			}
			
			.navigationTitle("New Event")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

extension NewEventViewController {
	var firstLine: some View {
		HStack(spacing: 16) {
			TextFieldView(text: $homeTeam, placeholder: "Team 1")
			TextFieldView(text: Binding(
				get: {
					self.homeScore != nil ? String(self.homeScore!) : ""
				},
				set: { newValue in
					
					if let value = Int(newValue) {
						self.homeScore = value
					}
				}
			), placeholder: "Team score")
			.keyboardType(.numberPad)
		}
	}
	
	var secondLine: some View {
		HStack(spacing: 16) {
			TextFieldView(text: $awayTeam, placeholder: "Team 2")
			TextFieldView(text: Binding(
				get: {
					self.awayScore != nil ? String(self.awayScore!) : ""
				},
				set: { newValue in
					if let value = Int(newValue) {
						self.awayScore = value
					}
				}
			), placeholder: "Team score")
			.keyboardType(.numberPad)
		}
	}
	
	var verticalStack: some View {
		VStack(spacing: 16) {
			TextFieldView(text: $location, placeholder: "Subtitle")
		}
	}
	
	var dateFormat: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		
		let dateString = dateFormatter.string(from: date)
		return dateString
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
