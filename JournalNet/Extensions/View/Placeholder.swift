//
//  Placeholder.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

extension View {
	func placeholder<Content: View>(
		when shouldShow: Bool,
		@ViewBuilder placeholder: () -> Content
	) -> some View {
		
		ZStack(alignment: .leading) {
			placeholder().opacity(shouldShow ? 1 : 0)
			self
		}
		.padding(10)
	}
}
