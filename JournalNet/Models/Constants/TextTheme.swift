//
//  TextTheme.swift
//  JournalNet
//
//  Created by Denis Abramov on 10.06.2024.
//

import Foundation

enum TextTheme {
	enum Main {
		static let articles = "Articles"
		static let events = "Events"
		static let budget = "Budget"
		static let posts = "Posts"
		static let settings = "Settings"
	}
	
	enum Empty {
		enum Title {
			static let article = "No articles added"
		}
		
		enum Description {
			static let article = "Add an articles with the plus icon above"
		}
	}
}
