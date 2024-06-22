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
		tabView
		.onAppear() {
			UITabBar.appearance().backgroundColor = color
			UITabBar.appearance().barTintColor = textColor
		}
	}
}

private extension TabViewController {
	var tabView: some View {
		TabView {
			ArticlesViewController()
				.tabItem {
					Label(
						TextTheme.Title.articles,
						systemImage: ImageTheme.article
					)
				}
			EventsViewController()
				.tabItem {
					Label(
						TextTheme.Title.events,
						systemImage: ImageTheme.event
					)
				}
			BudgetsViewController()
				.tabItem {
					Label(
						TextTheme.Title.budget,
						systemImage: ImageTheme.budget
					)
				}
			PostsViewController()
				.tabItem {
					Label(
						TextTheme.Title.posts,
						systemImage: ImageTheme.post
					)
				}
			SettingsViewController()
				.tabItem {
					Label(
						TextTheme.Title.settings,
						systemImage: ImageTheme.setting
					)
				}
		}
	}
}

#Preview {
    TabViewController()
}
