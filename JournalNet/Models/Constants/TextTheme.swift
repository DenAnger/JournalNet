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
		static let newBudget = "New budget"
		static let newPost = "New post"
		
		static let alert = "Your progress will be permanently reset. Do you really want to delete all data?"
	}
	
	enum Empty {
		enum Title {
			static let article = "No articles added"
			static let event = "No events added"
			static let budget = "No incomes added"
			static let post = "No posts added"
		}
		
		enum Description {
			static let article = "Add an articles with the plus icon above"
			static let event = "Add an event with the plus icon above"
			static let budget = "Add an income with the plus icon above"
			static let post = "Add an post with the plus icon above"
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
		static let title = "Title"
		static let decription = "Description"
		static let sum = "Sum"
	}
	
	enum Budget {
		static let income = "Income"
		static let expenses = "Expenses"
	}
	
	enum URL {
		static let urlApp = "https://apps.apple.com/app/idYOUR_APP_ID"
	}
	
	enum Button {
		static let share = "Share app"
		static let rate = "Rate app"
		static let profile = "Usage profile"
		static let progress = "Reset progress"
		static let configuration = "Reset Confirmation"
		static let reset = "Reset"
		static let cancel = "Cancel"
		static let add = "Add"
	}
	
	enum Status {
		static let write = "Written"
		static let sent = "Sent"
		static let publish = "Published"
		static let archive = "Archived"
		static let main = "Status"
	}
}
