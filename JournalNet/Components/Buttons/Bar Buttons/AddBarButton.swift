//
//  AddBarButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI

struct AddBarButton: View {
	var body: some View {
		Image(systemName: "plus.circle.fill")
			.foregroundStyle(Color(ColorTheme.backgroundView))
	}
}

#Preview {
	AddBarButton()
}
