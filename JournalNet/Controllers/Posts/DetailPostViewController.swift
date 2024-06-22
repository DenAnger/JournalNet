//
//  DetailPostViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import SwiftUI
import SwiftData

struct DetailPostViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.presentationMode)
	private var presentationMode

	@Binding
	var post: Post
	
	@Query
	private var posts: [Post] = []
	
	private let backgroundColor = ColorTheme.background
	private let mainTextColor = ColorTheme.mainText
	private let font = FontTheme.sfProRegular
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				VStack(spacing: 24) {
					titleView
					postView
					Spacer()
				}
			}
			
			.toolbar {
				ToolbarItem {
					DeleteBarButton(action: {
						modelContext.delete(post)
						presentationMode.wrappedValue.dismiss()
					})
				}
			}			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension DetailPostViewController {
	var titleView: some View {
		Text(post.title)
			.font(.custom(font, size: 18))
			.foregroundStyle(Color(mainTextColor))
	}
	
	var postView: some View {
		Text(post.post)
			.font(.custom(font, size: 15))
			.foregroundStyle(Color(mainTextColor))
	}
}

#Preview {
	DetailPostViewController(post: .constant(Post(title: "Title", post: "Description Post")))
}
