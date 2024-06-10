//
//  EmptyListView.swift
//  JournalNet
//
//  Created by Denis Abramov on 15.05.2024.
//

import SwiftUI

struct EmptyListView: View {
	
	let title: String
	let description: String
	
	private let backgroundColor = ColorTheme.background
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		VStack(spacing: 10) {
			Text(title)
				.font(.custom(font, size: 28))
				.foregroundStyle(Color(mainTextColor))
			Text(description)
				.font(.custom(font, size: 17))
				.foregroundStyle(Color(textColor))
		}
		.background(Color(backgroundColor))
	}
}

#Preview {
	EmptyListView(title: "Empty", description: "Add new")
}
