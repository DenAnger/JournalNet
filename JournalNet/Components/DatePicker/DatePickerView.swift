//
//  DatePickerView.swift
//  JournalNet
//
//  Created by Denis Abramov on 25.05.2024.
//

import SwiftUI

struct DatePickerView: View {
	
	@Binding
	var selectedDate: Date
	
	private let backgroundColor = ColorTheme.background
	private let backgroundViewColor = ColorTheme.backgroundView
	private let mainTextColor = ColorTheme.mainText
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		HStack {
			Text(selectedDate.formatted(.dateTime.day().month(.defaultDigits).year()))
				.font(.custom(font, size: 17))
				.foregroundStyle(Color(mainTextColor))
				.padding(.leading, 10)
				.overlay {
					DatePicker(selection: $selectedDate, displayedComponents: .date) {
					}
					.opacity(0.011)
				}
			Spacer()
		}
		.frame(height: 62)
		.background(Color(backgroundColor))
		.clipShape(Constant.cornerRadius)
		.overlay(
			Constant.cornerRadius
				.stroke(Color(backgroundViewColor), lineWidth: 1)
		)
	}
}

#Preview {
	DatePickerView(selectedDate: .constant(.now))
}
