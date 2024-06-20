//
//  EventsViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI
import SwiftData

struct EventsViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Query
	private var events: [Event] = []
	
	private let title = TextTheme.Title.events
	private let backgroundColor = ColorTheme.background
	private let titleEmpty = TextTheme.Empty.Title.event
	private let descriptionEmpty = TextTheme.Empty.Description.event
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				
				if events.isEmpty {
					EmptyListView(
						title: titleEmpty,
						description: descriptionEmpty
					)
				} else {
					navigationStack
				}
			}
			.toolbar {
				NavigationLink(
					destination: NewEventViewController(),
					label: {
						AddBarButton()
					}
				)
			}
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
		}
	}
}

private extension EventsViewController {
	var navigationStack: some View {
		List(events, id: \.id) { event in
			ZStack {
				MainCell(
					contentView: ContentView(contentType: .date(event.date)),
					title: event.homeTeam,
					description: event.location
				)
				NavigationLink(
					destination: DetailEventViewController(event: .constant(event)),
					label: {
						EmptyView()
					}
				)
			}
			.listRowBackground(Color(backgroundColor))
		}
		.listStyle(PlainListStyle())
		.background(Color(backgroundColor))
	}
}

#Preview {
	EventsViewController()
}
