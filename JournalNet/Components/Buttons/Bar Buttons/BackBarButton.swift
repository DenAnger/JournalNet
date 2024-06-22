//
//  BackBarButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

struct BackBarButton: View {
	
	@Environment(\.presentationMode)
	var presentationMode
	
	var body: some View {
		Button(action: {
			presentationMode.wrappedValue.dismiss()
		}) {
			Image(systemName: ImageTheme.backBar)
				.foregroundColor(.white)
		}
	}
}

#Preview {
	BackBarButton()
}
