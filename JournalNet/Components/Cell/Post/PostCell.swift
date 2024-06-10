//
//  PostCell.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import SwiftUI

struct PostCell: View {
	var title: String
	var post: String
	
	private let backgroundCellColor = ColorTheme.backgroundCell
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		VStack(spacing: 8) {
			titleView
			postView
		}
		.padding(20)
		.background(Color(backgroundCellColor))
		.clipShape(Constant.cornerRadius)
	}
}
	
private extension PostCell {
	var titleView: some View {
		Text(title)
			.font(.custom(font, size: 22))
			.foregroundStyle(Color(mainTextColor))
			.frame(maxWidth: .infinity, alignment: .leading)
			.multilineTextAlignment(.leading)
			.lineLimit(2)
	}
	
	var postView: some View {
		Text(post)
			.font(.custom(font, size: 15))
			.foregroundStyle(Color(textColor))
			.frame(maxWidth: .infinity, alignment: .leading)
			.multilineTextAlignment(.leading)
			.lineLimit(1)
	}
}

#Preview {
	PostCell(title: "Title", post: "332423")
}
