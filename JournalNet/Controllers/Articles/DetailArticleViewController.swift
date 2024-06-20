//
//  DetailArticleViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 24.05.2024.
//

import SwiftUI
import SwiftData

struct DetailArticleViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.presentationMode)
	private var presentationMode
	
	@Binding
	var article: Article
	
	@Query
	private var articles: [Article] = []
	
	private let backgroundColor = ColorTheme.background
	private let mainTextColor = ColorTheme.mainText
	private let textColor = ColorTheme.text
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				VStack(spacing: 24) {
					firstLine
					secondLine
					thirdLine
					Spacer()
				}
				.padding(.top, 10)
				.padding(.horizontal, 16)
			}
			
			.toolbar {
				ToolbarItem {
					DeleteBarButton(action: {
						modelContext.delete(article)
						presentationMode.wrappedValue.dismiss()
					})
				}
			}
			
			.navigationTitle(article.title)
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension DetailArticleViewController {
	var firstLine: some View {
		HStack {
			Text(article.status)
				.font(.custom(font, size: 17))
				.foregroundStyle(Color(mainTextColor))
			Spacer()
			
			let contentType: ContentView.ContentType = {
				guard let sport = Sport(rawValue: article.sport) else {
					return .none
				}
				return .sport(sport)
			}()
			ContentView(contentType: contentType)
		}
	}
	
	var secondLine: some View {
		HStack {
			Text(article.publisher)
				.font(.custom(font, size: 17))
				.foregroundStyle(Color(textColor))
			Spacer()
		}
	}
	
	var thirdLine: some View {
		HStack {
			Text(article.article)
				.font(.custom(font, size: 15))
				.foregroundStyle(Color(mainTextColor))
			Spacer()
		}
	}
}

#Preview {
	DetailArticleViewController(article: .constant(Article(
		title: "Title",
		sport: "Other",
		status: "Written",
		publisher: "Publish",
		article: "Article"
	)))
	.modelContainer(for: Article.self, inMemory: true)
}
