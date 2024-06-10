//
//  UISegmentedControl.swift
//  JournalNet
//
//  Created by Denis Abramov on 22.05.2024.
//

import UIKit

extension UISegmentedControl {
	override open func didMoveToSuperview() {
		super.didMoveToSuperview()
		self.setContentHuggingPriority(.defaultLow, for: .vertical)
	}
}
