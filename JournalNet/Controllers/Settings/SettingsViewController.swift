//
//  SettingsViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 26.05.2024.
//

import SwiftUI
import StoreKit

struct SettingsViewController: View {
	
	@Environment(\.requestReview) private var requestReview
	
	@State private var showAlert = false
	
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
			
			.navigationTitle("Settings")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
		}
	}
}

private extension SettingsViewController {
	var mainView: some View {
		VStack(spacing: 8) {
			SettingsButton(
				icon: Image(systemName: "square.and.arrow.up.fill"),
				title: "Share app",
				backgroundColor: Color(backgroundCellColor)
			) {
				let activityViewController = UIActivityViewController(
					activityItems: [URL(string: "https://apps.apple.com/app/idYOUR_APP_ID")!],
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
			
			SettingsButton(
				icon: Image(systemName: "star.fill"),
				title: "Rate app",
				backgroundColor: Color(backgroundCellColor)
			) {
				DispatchQueue.main.async {
					self.requestReview()
				}
			}
			
			SettingsButton(
				icon: Image(systemName: "doc.text"),
				title: "Usage profile",
				backgroundColor: Color(backgroundCellColor)
			) {
				print("Usage profile")
			}
			
			SettingsButton(
				icon: Image(systemName: "arrow.triangle.2.circlepath"),
				title: "Reset progress",
				backgroundColor: .red
			) {
				showAlert = true
			}.alert("Reset Confirmation", isPresented: $showAlert) {
				Button("Reset", role: .cancel) {
					print("Reset")
				}
				Button("Cancel", role: .destructive) { }
			} message: {
				Text("Your progress will be permanently reset. Do you really want to delete all data?")
			}
			Spacer()
		}
	}
}

#Preview {
    SettingsViewController()
}
