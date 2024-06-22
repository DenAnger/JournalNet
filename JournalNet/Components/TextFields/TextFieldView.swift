//
//  TextFieldView.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

struct TextFieldView: View {
	
	@Binding
	var text: String
	
	let placeholder: String
	let axis: Axis?
	
	private let backgroundColor = ColorTheme.background
	private let backgroundViewColor = ColorTheme.backgroundView
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	init(text: Binding<String>, placeholder: String, axis: Axis? = .horizontal) {
		self._text = text
		self.placeholder = placeholder
		self.axis = axis
	}
	
	var body: some View {
		TextField("", text: $text, axis: axis ?? .horizontal)
			.font(.custom(font, size: 17))
			.foregroundStyle(Color(mainTextColor))
		
			.placeholder(when: text.isEmpty, placeholder: {
				Text(placeholder).foregroundColor(Color(textColor))
					.font(.custom(font, size: 17))
			})
		
			.frame(minHeight: 62)
			.background(Color(backgroundColor))
			.clipShape(Constant.cornerRadius)
			.overlay(
				Constant.cornerRadius
					.stroke(color, lineWidth: 1)
			)
	}
	
	private var color: Color {
		return text.isEmpty ? Color(textColor) : Color(backgroundViewColor)
	}
}

#Preview {
	TextFieldView(text: .constant(""), placeholder: "Input text", axis: .vertical)
}
