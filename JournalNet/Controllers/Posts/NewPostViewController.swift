//
//  NewPostViewController.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import SwiftUI
import SwiftData

struct NewPostViewController: View {
	
	@Environment(\.modelContext)
	private var modelContext
	
	@Environment(\.dismiss)
	private var dismiss

	@State
	private var title: String = ""

	@State
	private var post: String = ""
	
	@FocusState private var isTextFieldFocused: Bool
	
	private let backgroundColor = ColorTheme.background
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				VStack(spacing: 16) {
					TextFieldView(text: $title, placeholder: "Title")
					TextFieldView(text: $post, placeholder: "Text", axis: .vertical)
					
					Spacer()
					AddButton(action: {
						saveNewPost()
						dismiss()
					})
					.padding(.bottom, 10)
					.disabled(title.isEmpty || post.isEmpty)
				}
				.focused($isTextFieldFocused)
				.padding(.top, 18)
				.padding(.horizontal, 16)
			}
			.onTapGesture {
				if isTextFieldFocused {
					isTextFieldFocused = false
				}
			}
			
			.navigationTitle("New post")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension NewPostViewController {
	func saveNewPost() {
		let newPost = Post(title: title,
						   post: post)
		modelContext.insert(newPost)
	}
}

#Preview {
	NewPostViewController()
		.modelContainer(for: Post.self, inMemory: true)
}
