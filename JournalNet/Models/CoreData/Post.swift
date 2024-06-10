//
//  Post.swift
//  JournalNet
//
//  Created by Denis Abramov on 23.05.2024.
//

import Foundation
import SwiftData

@Model
final class Post {
	var title: String
	var post: String
	
	init(title: String, post: String) {
		self.title = title
		self.post = post
	}
}
