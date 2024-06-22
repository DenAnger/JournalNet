//
//  DeleteBarButton.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

struct DeleteBarButton: View {
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Image(systemName: ImageTheme.delete)
				.foregroundStyle(.gray)
		}
	}
}

#Preview {
	DeleteBarButton(action: {})
}
