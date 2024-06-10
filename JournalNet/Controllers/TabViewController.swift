//
//  TabViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI

struct TabViewController: View {
	
	private let color = ColorTheme.backgroundTab
	private let textColor = ColorTheme.text
	
	var body: some View {
		TabView {
			ArticlesViewController()
				.tabItem {
					Label(
						TextTheme.Main.articles,
						systemImage: ImageTheme.doc
					)
				}
			EventsViewController()
				.tabItem {
					Label(
						TextTheme.Main.events,
						systemImage: ImageTheme.trophy
					)
				}
			BudgetsViewController()
				.tabItem {
					Label(
						TextTheme.Main.budget,
						systemImage: ImageTheme.dollar
					)
				}
			PostsViewController()
				.tabItem {
					Label(
						TextTheme.Main.posts,
						systemImage: ImageTheme.newspaper
					)
				}
			SettingsViewController()
				.tabItem {
					Label(
						TextTheme.Main.settings,
						systemImage: ImageTheme.newspaper
					)
				}
		}
		.onAppear() {
			UITabBar.appearance().backgroundColor = color
			UITabBar.appearance().barTintColor = textColor
		}
	}
}

#Preview {
    TabViewController()
}
