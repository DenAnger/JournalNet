//
//  AddBarButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI

struct AddBarButton: View {
	var body: some View {
		Image(systemName: ImageTheme.add)
			.foregroundStyle(Color(ColorTheme.backgroundView))
	}
}

#Preview {
	AddBarButton()
}
