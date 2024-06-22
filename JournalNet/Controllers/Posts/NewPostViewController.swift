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
	private var titleTextField = ""
	
	@State
	private var post = ""
	
	@FocusState
	private var isTextFieldFocused: Bool
	
	private let title = TextTheme.Title.newPost
	private let backgroundColor = ColorTheme.background
	private let titlePlaceholder = TextTheme.Placeholder.title
	private let descriptionPlaceholder = TextTheme.Placeholder.title
	
	var body: some View {
		NavigationStack {
			ZStack {
				Color(backgroundColor).ignoresSafeArea()
				VStack(spacing: 16) {
					TextFieldView(text: $titleTextField, placeholder: titlePlaceholder)
					TextFieldView(text: $post, placeholder: descriptionPlaceholder, axis: .vertical)
					
					Spacer()
					AddButton(action: {
						saveNewPost()
						dismiss()
					})
					.padding(.bottom, 10)
					.disabled(titleTextField.isEmpty || post.isEmpty)
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
			
			.navigationTitle(title)
			.navigationBarTitleDisplayMode(.large)
			.navigationBarTitleTextColor(.white)
			
			.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: BackBarButton())
		}
	}
}

private extension NewPostViewController {
	func saveNewPost() {
		let newPost = Post(title: titleTextField, post: post)
		modelContext.insert(newPost)
	}
}

#Preview {
	NewPostViewController()
		.modelContainer(for: Post.self, inMemory: true)
}
