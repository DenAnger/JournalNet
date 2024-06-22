//
//  SettingsCell.swift
//  JournalNet
//
//  Created by Denis Abramov on 26.05.2024.
//

import SwiftUI

struct SettingsCell: View {
	let icon: String
	let title: String
	
	let action: () -> Void
	
	private let isLastCell = false
	
	private let backgroundCellColor = ColorTheme.backgroundCell
	private let mainTextColor = ColorTheme.mainText
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		VStack(spacing: 10) {
			HStack {
				Image(systemName: icon)
					.foregroundStyle(Color(mainTextColor))
					.frame(height: 41)
				Spacer()
			}
			HStack {
				Text(title)
					.font(.custom(font, size: 16))
					.foregroundStyle(Color(mainTextColor))
				Spacer()
			}
		}
		.frame(maxWidth: .infinity)
		.padding(20)
		.background(isLastCell ? Color.red : Color(backgroundCellColor))
		.clipShape(Constant.cornerRadius)
		
		.onTapGesture {
			action()
		}
	}
}

#Preview {
	SettingsCell(
		icon: ImageTheme.article,
		title: TextTheme.Placeholder.title,
		action: {
			print("check")
		}
	)
}
