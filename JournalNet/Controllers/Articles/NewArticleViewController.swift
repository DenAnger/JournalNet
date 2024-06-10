//
//  NewArticleViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 24.05.2024.
//

import SwiftUI
import SwiftData

struct NewArticleViewController: View {
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.dismiss)
	private var dismiss
	
	@State private var headline: String = ""
	@State private var sport: String = ""
	@State private var status: String = "Status"
	@State private var publisher: String = ""
	@State private var article: String = ""
	
	@FocusState private var isTextFieldFocused: Bool
	
	private let backgroundColor = ColorTheme.background
	private let backgroundViewColor = ColorTheme.backgroundView
	private let textColor = ColorTheme.text
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				ScrollView {
					VStack(spacing: 16) {
						TextFieldView(text: $headline, placeholder: "Headline")
						CarouselView(selectedSport: $sport)
						menuView
						
						TextFieldView(text: $publisher, placeholder: "Publisher")
						TextFieldView(text: $article, placeholder: "Article text", axis: .vertical)
						
						Spacer()
						AddButton(action: {
							saveNewEvent()
							dismiss()
						})
						.padding(.bottom, 10)
						.disabled(
							headline.isEmpty ||
							sport.isEmpty ||
							status.isEmpty ||
							publisher.isEmpty ||
							article.isEmpty
						)
					}
					.focused($isTextFieldFocused)
					
					.padding(.top, 18)
					.padding(.horizontal, 16)
					.ignoresSafeArea(.keyboard)
				}
			}
			.onTapGesture {
				if isTextFieldFocused {
					isTextFieldFocused = false
				}
			}
			
			.navigationTitle("New article")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension NewArticleViewController {
	var menuView: some View {
		ZStack {
			MenuView(status: $status)
		}
		.frame(maxWidth: .infinity)
		.frame(height: 62)
		.background(Color(backgroundColor))
		.clipShape(Constant.cornerRadius)
		.overlay(
			Constant.cornerRadius
				.stroke(color, lineWidth: 1)
		)
	}
}

private extension NewArticleViewController {
	var color: Color {
		return status == "Status" ? Color(textColor) : Color(backgroundViewColor)
	}
	
	func saveNewEvent() {
		let newArticle = Article(
			title: headline,
			sport: sport,
			status: status,
			publisher: publisher,
			article: article
		)
		modelContext.insert(newArticle)
	}
}

#Preview {
	NewArticleViewController()
		.modelContainer(for: Article.self, inMemory: true)
}
