//
//  ArticlesViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 14.05.2024.
//

import SwiftUI
import SwiftData

struct ArticlesViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Query
	private var articles: [Article] = []
	
	private let title = TextTheme.Title.articles
	private let backgroundColor = ColorTheme.background
	private let titleEmpty = TextTheme.Empty.Title.article
	private let descriptionEmpty = TextTheme.Empty.Description.article
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				
				if articles.isEmpty {
					EmptyListView(
						title: titleEmpty,
						description: descriptionEmpty
					)
				} else {
					navigationStack
				}
			}
			.toolbar {
				NavigationLink(
					destination: NewArticleViewController(),
					label: {
						AddBarButton()
					}
				)
			}
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
		}
    }
}

private extension ArticlesViewController {
	var navigationStack: some View {
		List(articles, id: \.id) { article in
			ZStack {
				let contentType: ContentView.ContentType = {
					
					guard let sport = Sport(rawValue: article.sport) else {
						return .none
					}
					return .sport(sport)
				}()
				
				MainCell(
					contentView: ContentView(contentType: contentType),
					title: article.title
				)
				NavigationLink(
					destination: DetailArticleViewController(article: .constant(article)),
					label: {
						EmptyView()
					}
				)
			}
			.listRowBackground(Color(backgroundColor))
		}
		.listStyle(PlainListStyle())
		.background(Color(backgroundColor))
	}
}

#Preview {
	ArticlesViewController()
        .modelContainer(for: Article.self, inMemory: true)
}
