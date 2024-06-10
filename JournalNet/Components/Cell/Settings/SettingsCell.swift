//
//  SettingsCell.swift
//  JournalNet
//
//  Created by Denis Abramov on 26.05.2024.
//

import SwiftUI

struct SettingsCell: View {
	var icon: String
	var title: String
	
	var action: () -> Void
	
	var isLastCell: Bool = false
	
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
	SettingsCell(icon: "doc", title: "Title", action: {print("check")})
}
