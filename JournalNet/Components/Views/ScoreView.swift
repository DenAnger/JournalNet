//
//  ScoreView.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

struct ScoreView: View {
	
	let homeScore: Int
	let awayScore: Int
	
	let homeName: String
	let awayName: String
	
	@State
	var widthHome: CGFloat = 10
	
	private let backgroundColor = ColorTheme.background
	private let mainTextColor = ColorTheme.mainText
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		VStack {
			scoreView
			nameView
		}
		.background(Color(backgroundColor))
	}
}

private extension ScoreView {
	var scoreView: some View {
		HStack {
			Text(String(homeScore))
				.frame(width: UIScreen.main.bounds.width / 2.5)
			Text(":")
				.frame(width: UIScreen.main.bounds.width / 12)
			Text(String(awayScore))
				.frame(width: UIScreen.main.bounds.width / 2.5)
		}
		.font(.custom(font, size: 68))
		.foregroundStyle(Color(mainTextColor))
	}
	
	var nameView: some View {
		HStack {
			Text(String(homeName))
				.frame(width: UIScreen.main.bounds.width / 2.2)
			Text(String(awayName))
				.frame(width: UIScreen.main.bounds.width / 2.2)
		}
		.font(.custom(font, size: 17))
		.foregroundStyle(Color(mainTextColor))
		.multilineTextAlignment(.center)
	}
}

#Preview {
	ScoreView(homeScore: 0, awayScore: 0, homeName: "Febers Toronto", awayName: "Toronto Febers")
}
