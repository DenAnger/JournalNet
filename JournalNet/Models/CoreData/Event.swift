//
//  Event.swift
//  JournalNet
//
//  Created by Denis Abramov on 20.05.2024.
//

import Foundation
import SwiftData

@Model
final class Event {
	var date: Date
	var homeTeam: String
	var awayTeam: String
	var homeScore: Int
	var awayScore: Int
	var sport: String
	var location: String
	
	init(
		date: Date,
		homeTeam: String,
		awayTeam: String,
		homeScore: Int,
		awayScore: Int,
		sport: String,
		location: String
	) {
		self.date = date
		self.homeTeam = homeTeam
		self.awayTeam = awayTeam
		self.homeScore = homeScore
		self.awayScore = awayScore
		self.sport = sport
		self.location = location
	}
}
