//
//  DetailEventViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI
import SwiftData

struct DetailEventViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.dismiss)
	private var dismiss
	
	@Binding
	var event: Event
	
	@Query
	private var events: [Event] = []
	
	private let backgroundColor = ColorTheme.background
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		NavigationStack {
			mainView
				.toolbar {
					ToolbarItem {
						DeleteBarButton(action: {
							modelContext.delete(event)
							dismiss()
						})
					}
				}
			
				.navigationTitle("\(event.homeTeam) VS \(event.awayTeam)")
				.navigationBarTitleDisplayMode(.large)
				.navigationBarTitleTextColor(.white)
			
				.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension DetailEventViewController {
	var mainView: some View {
		ZStack {
			Color(backgroundColor).ignoresSafeArea()
			VStack(spacing: 24) {
				HStack {
					description
					Spacer()
					date
				}
				.padding(.top, 10)
				.padding(.horizontal, 16)
				ScoreView(
					homeScore: event.homeScore,
					awayScore: event.awayScore,
					homeName: event.homeTeam,
					awayName: event.awayTeam
				)
				Spacer()
			}
		}
	}
	
	var description: some View {
		Text(event.location)
			.font(.custom(font, size: 15))
			.foregroundStyle(Color(textColor))
	}
	
	var date: some View {
		ContentView(contentType: .date(event.date))
	}
}

#Preview {
	DetailEventViewController(event: .constant(Event(
		date: .now,
		homeTeam: "first",
		awayTeam: "second",
		homeScore: 0,
		awayScore: 1,
		sport: "basketball",
		location: "denver"
	)))
	.modelContainer(for: Event.self, inMemory: true)
}
