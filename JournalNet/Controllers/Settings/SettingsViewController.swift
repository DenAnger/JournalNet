//
//  SettingsViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 26.05.2024.
//

import SwiftUI
import StoreKit

struct SettingsViewController: View {
	
	@Environment(\.requestReview)
	private var requestReview
	
	@State
	private var showAlert = false
	
	private let title = TextTheme.Title.settings
	private let backgroundColor = ColorTheme.background
	private let backgroundCellColor = ColorTheme.backgroundCell
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				mainView
					.padding(.horizontal, 16)
			}
			.listStyle(PlainListStyle())
			
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
		}
	}
}

private extension SettingsViewController {
	var mainView: some View {
		VStack(spacing: 8) {
			SettingsButton(
				icon: Image(systemName: ImageTheme.share),
				title: TextTheme.Button.share,
				backgroundColor: Color(backgroundCellColor)
			) {
				shareAction()
			}
			
			SettingsButton(
				icon: Image(systemName: ImageTheme.rate),
				title: TextTheme.Button.rate,
				backgroundColor: Color(backgroundCellColor)
			) {
				DispatchQueue.main.async {
					self.requestReview()
				}
			}
			
			SettingsButton(
				icon: Image(systemName: ImageTheme.profile),
				title: TextTheme.Button.profile,
				backgroundColor: Color(backgroundCellColor)
			) { }
			
			SettingsButton(
				icon: Image(systemName: ImageTheme.progress),
				title: TextTheme.Button.progress,
				backgroundColor: .red
			) {
				showAlert = true
			}.alert(TextTheme.Button.configuration, isPresented: $showAlert) {
				Button(TextTheme.Button.reset, role: .cancel) { }
				Button(TextTheme.Button.cancel, role: .destructive) { }
			} message: {
				Text(TextTheme.Title.alert)
			}
			Spacer()
		}
	}
}

private extension SettingsViewController {
	func shareAction() {
		let activityViewController = UIActivityViewController(
			activityItems: [URL(string: TextTheme.URL.urlApp)!],
			applicationActivities: nil
		)
		
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
			return
		}
		
		windowScene.windows.first?.rootViewController?.present(
			activityViewController,
			animated: true,
			completion: nil
		)
	}
}

#Preview {
	SettingsViewController()
}
