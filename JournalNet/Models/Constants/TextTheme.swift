//
//  TextTheme.swift
//  JournalNet
//
//  Created by Denis Abramov on 10.06.2024.
//

import Foundation

enum TextTheme {
	enum Title {
		static let articles = "Articles"
		static let events = "Events"
		static let budget = "Budget"
		static let posts = "Posts"
		static let settings = "Settings"
		
		static let newArticle = "New Article"
		static let newEvent = "New Event"
	}
	
	enum Empty {
		enum Title {
			static let article = "No articles added"
			static let event = "No events added"
		}
		
		enum Description {
			static let article = "Add an articles with the plus icon above"
			static let event = "Add an event with the plus icon above"
		}
	}
	
	enum Placeholder {
		static let headline = "Headline"
		static let publisher = "Publisher"
		static let article = "Article text"
		static let teamHome = "Team 1"
		static let teamAway = "Team 2"
		static let teamScore = "Team score"
		static let subtitle = "Subtitle"
	}
}
