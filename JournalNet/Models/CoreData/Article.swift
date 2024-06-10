//
//  Article.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import Foundation
import SwiftData

@Model
final class Article {
	var title: String
	var sport: String
	var status: String
	var publisher: String
	var article: String
	
	init(
		title: String,
		sport: String,
		status: String,
		publisher: String,
		article: String
	) {
		self.title = title
		self.sport = sport
		self.status = status
		self.publisher = publisher
		self.article = article
	}
}
