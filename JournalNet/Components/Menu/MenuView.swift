//
//  MenuView.swift
//  JournalNet
//
//  Created by Denis Abramov on 24.05.2024.
//

import SwiftUI

struct MenuView: View {
	
	@Binding
	var status: String
	
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	
	var body: some View {
		Menu {
			Button(role: .cancel) {
				status = "Written"
			} label: {
				Text("Written")
			}
			Button(role: .cancel) {
				status = "Sent"
			} label: {
				Text("Sent")
			}
			Button(role: .cancel) {
				status = "Published"
			} label: {
				Text("Published")
			}
			Button(role: .cancel) {
				status = "Archived"
			} label: {
				Text("Archived")
			}
		} label: {
			HStack {
				Text(status)
				Image(systemName: status == "Status" ? "chevron.down" : "chevron.up")
			}
			.foregroundStyle(status == "Status" ? Color(textColor) : Color(mainTextColor))
			.padding(.leading, 10)
			Spacer()
		}
	}
}

#Preview {
	MenuView(status: .constant("St"))
}
