//
//  Settings.swift
//  SurvataDemo
//
//  Created by Rex Sheng on 2/19/16.
//  Copyright © 2016 InteractiveLabs. All rights reserved.
//

import Greycats

struct Settings {
	static var publisherId: String! = "a152f0c5-0ba4-4b3e-8a0a-07ec9f96c5fd"
	static var previewId: String! = nil 
	static var contentName: String!
	static var forceZipcode: String!
	static var sendZipcode: Bool = true
}

class Field: FormField {
	
	@IBOutlet weak var fieldHeight: NSLayoutConstraint!
	var onToggle: ((Bool) -> ())?
	
	@IBInspectable var hasToggle: Bool = true {
		didSet {
			setToggle()
		}
	}
	@IBOutlet weak var toggleSwitch: UISwitch! {
		didSet {
			setToggle()
		}
	}
	
	func setToggle() {
		toggleSwitch?.hidden = !hasToggle
	}
	
	@IBAction func didToggle(sender: AnyObject) {
		onToggle?(toggleSwitch.on)
		fieldHeight.constant = toggleSwitch.on ? 32 : 0
		UIView.animateWithDuration(0.25) { self.layoutIfNeeded() }
	}
}

class SettingsViewController: UIViewController {
	@IBOutlet weak var publisherIdField: Field!
	@IBOutlet weak var previewField: Field!
	@IBOutlet weak var contentNameField: Field!
	@IBOutlet weak var zipcodeField: Field!
	
	override func viewDidLoad() {
		[publisherIdField, previewField, contentNameField, zipcodeField].createForm(self)
		contentNameField.onToggle = {[weak self] on in
			if !on {
				Settings.contentName = nil
				self?.contentNameField.text = nil
			}
		}
		zipcodeField.onToggle = { Settings.sendZipcode = $0 }
		reset()
	}
	
	@IBAction func reset() {
		Settings.publisherId = "a152f0c5-0ba4-4b3e-8a0a-07ec9f96c5fd"
		Settings.previewId = nil//"5fd725139884422e9f1bb28f776c702d"
		publisherIdField.bind(&Settings.publisherId)
		previewField.bind(&Settings.previewId)
		contentNameField.bind(&Settings.contentName)
		zipcodeField.bind(&Settings.forceZipcode)
	}
}