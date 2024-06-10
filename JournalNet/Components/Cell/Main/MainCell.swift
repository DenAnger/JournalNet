//
//  MainCell.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI

struct MainCell: View {
	
	var contentView: ContentView
	var title: String
	var description: String?
	
	private let backgroundCellColor = ColorTheme.backgroundCell
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
    var body: some View {
		VStack(spacing: 8) {
			HStack {
				contentView
				Spacer(minLength: 20)
				descriptionView
			}
			titleView
		}
		.padding(20)
		.background(Color(backgroundCellColor))
		.clipShape(Constant.cornerRadius)
    }
}

private extension MainCell {
	var titleView: some View {
		Text(title)
			.font(.custom(font, size: 22))
			.foregroundStyle(Color(mainTextColor))
			.frame(maxWidth: .infinity, alignment: .leading)
			.multilineTextAlignment(.leading)
			.lineLimit(2)
	}
	
	@ViewBuilder
	var descriptionView: some View {
		
		if let description = description {
			Text(description)
				.font(.custom(font, size: 15))
				.foregroundStyle(Color(textColor))
				.lineLimit(1)
		}
	}
}

#Preview {
	MainCell(contentView: ContentView(contentType: .sport(.basketball)),
			 title: "Febers vs Toronto",
			 description: "Sky arena, Denver")
}
