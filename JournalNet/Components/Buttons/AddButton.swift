//
//  AddButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 22.05.2024.
//

import SwiftUI

struct AddButton: View {
	
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Text("Add")
				.font(.custom(FontTheme.sfProRegular, size: 17))
				.foregroundStyle(Color(ColorTheme.mainText))
		}
		.padding(20)
		.frame(maxWidth: .infinity)
		.background(.blue)
		.buttonStyle(.plain)
		.clipShape(Constant.cornerRadius)
	}
}

#Preview {
	AddButton(action: { print("Pressed")})
}
