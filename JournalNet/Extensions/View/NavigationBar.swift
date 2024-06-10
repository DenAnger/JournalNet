//
//  NavigationBar.swift
//  JournalNet
//
//  Created by Denis Abramov on 21.05.2024.
//

import SwiftUI

extension View {
	/// Sets the text color for a navigation bar title.
	/// - Parameter color: Color the title should be
	///
	/// Supports both regular and large titles.
	func navigationBarTitleTextColor(_ color: Color) -> some View {
		let uiColor = UIColor(color)
		
		// Set appearance for both normal and large sizes.
		UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor]
		UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor]
		
		return self
	}
}
