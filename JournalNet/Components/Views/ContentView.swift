//
//  ContentView.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI

struct ContentView: View {
	
	enum ContentType {
		case sport(Sport)
		case date(Date)
		case none
	}
	
	let contentType: ContentType
	
	private let backgroundViewColor = ColorTheme.backgroundView
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		Group {
			if case .sport(let sport) = contentType {
				Text(sport.rawValue)
			} else if case .date(let date) = contentType {
				Text(date.formatted(.dateTime.day().month(.defaultDigits).year()))
			}
		}
		.font(.custom(font, size: 11))
		.foregroundStyle(.white)
		.padding(.horizontal, 8)
		.padding(.vertical, 4)
		.frame(height: 21)
		.background(Color(backgroundViewColor))
		.clipShape(Constant.cornerRadius)
	}
}

#Preview {
	ContentView(contentType: .date(.now))
}
