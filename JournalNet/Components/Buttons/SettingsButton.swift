//
//  SettingsButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 26.05.2024.
//

import SwiftUI

struct SettingsButton: View {
	
	var icon: Image
	var title: String
	
	var backgroundColor: Color
	var action: () -> Void
	
	private let mainTextColor = ColorTheme.mainText
	
	var body: some View {
		Button(action: {
			action()
		}) {
			VStack(spacing: 10) {
				HStack {
					icon
						.foregroundStyle(Color(mainTextColor))
						.frame(height: 41)
					Spacer()
				}
				
				HStack {
					Text(title)
						.font(.custom(FontTheme.sfProRegular, size: 16))
						.foregroundStyle(Color(mainTextColor))
					Spacer()
				}
			}
			.padding(20)
			.frame(maxWidth: .infinity)
			.background(backgroundColor)
			.clipShape(Constant.cornerRadius)
		}
	}
}

#Preview {
	SettingsButton(icon: Image(systemName: "doc"), title: "String", backgroundColor: .red, action: {})
}
