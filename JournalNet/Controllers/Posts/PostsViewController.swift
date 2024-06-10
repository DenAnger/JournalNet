//
//  PostsViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import SwiftUI
import SwiftData

struct PostsViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Query
	private var posts: [Post] = []
	
	private let backgroundColor = ColorTheme.background
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				
				if posts.isEmpty {
					EmptyListView(
						title: "No posts added",
						description: "Add an post with the plus icon above"
					)
				} else {
					navigationStack
				}
			}
			.toolbar {
				ToolbarItem {
					NavigationLink(
						destination: NewPostViewController(),
						label: {
							AddBarButton()
						}
					)
				}
			}
			.navigationTitle("Posts")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
		}
	}
}

private extension PostsViewController {
	var navigationStack: some View {
		List(posts, id: \.id) { post in
			ZStack {
				PostCell(title: post.title, post: post.post)
				NavigationLink(
					destination: DetailPostViewController(post: .constant(post)),
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

private extension PostsViewController {
	func deleteItems(offsets: IndexSet) {
		withAnimation {
			for index in offsets {
				modelContext.delete(posts[index])
			}
		}
	}
}

#Preview {
    PostsViewController()
}
