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
	
	private let write = TextTheme.Status.write
	private let sent = TextTheme.Status.sent
	private let publish = TextTheme.Status.publish
	private let archive = TextTheme.Status.archive
	private let main = TextTheme.Status.main
	
	private let up = "chevron.up"
	private let down = "chevron.down"
	
	var body: some View {
		Menu {
			Button(role: .cancel) {
				status = write
			} label: {
				Text(write)
			}
			Button(role: .cancel) {
				status = sent
			} label: {
				Text(sent)
			}
			Button(role: .cancel) {
				status = publish
			} label: {
				Text(publish)
			}
			Button(role: .cancel) {
				status = archive
			} label: {
				Text(archive)
			}
		} label: {
			HStack {
				Text(status)
				Image(systemName: status == main ? down : up)
			}
			.foregroundStyle(status == main ? Color(textColor) : Color(mainTextColor))
			.padding(.leading, 10)
			Spacer()
		}
	}
}

#Preview {
	MenuView(status: .constant("Example"))
}
