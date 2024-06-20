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
	
	@State
	private var headline = ""
	
	@State
	private var sport = ""
	
	@State
	private var status = "Status"
	
	@State
	private var publisher = ""
	
	@State
	private var article = ""
	
	@FocusState
	private var isTextFieldFocused: Bool
	
	private let title = TextTheme.Title.newArticle
	private let backgroundColor = ColorTheme.background
	private let backgroundViewColor = ColorTheme.backgroundView
	private let textColor = ColorTheme.text
	private let headlinePlaceholder = TextTheme.Placeholder.headline
	private let publisherPlaceholder = TextTheme.Placeholder.publisher
	private let articlePlaceholder = TextTheme.Placeholder.article
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				scrollView
			}
			.onTapGesture {
				if isTextFieldFocused {
					isTextFieldFocused = false
				}
			}
			
			.navigationTitle(title)
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
	
	var scrollView: some View {
		ScrollView {
			VStack(spacing: 16) {
				TextFieldView(text: $headline, placeholder: headlinePlaceholder)
				CarouselView(selectedSport: $sport)
				menuView
				
				TextFieldView(text: $publisher, placeholder: publisherPlaceholder)
				TextFieldView(text: $article, placeholder: articlePlaceholder, axis: .vertical)
				
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
