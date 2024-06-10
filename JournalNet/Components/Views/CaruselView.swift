//
//  CaruselView.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

struct CarouselView: View {
	private let items: [Sport] = [.basketball, .box, .football, .golf, .hockey, .volleyball, .other]
	
	@Binding
	var selectedSport: String
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 8) {
				ForEach(items.indices, id: \.self) { index in
					let isSelected =  items[index].rawValue == selectedSport
					let item = items[index]
					ContentView(contentType: .sport(item))
						.opacity(isSelected ? 1 : 0.5)
						.scaleEffect(isSelected ? 1.1 : 1)
						.animation(.easeInOut, value: isSelected)
						.onTapGesture {
							selectedSport = item.rawValue
						}
				}
			}
			.padding(.horizontal, 2)
		}
	}
}

#Preview {
	CarouselView(selectedSport: .constant(""))
}
