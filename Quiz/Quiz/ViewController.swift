//
//  ViewController.swift
//  Quiz
//
//  Created by Jint on 3/14/16.
//  Copyright © 2016 iLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var percentageLabel: UILabel!
	var percentage = 69

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func lowerPercentage(sender: AnyObject) {
		if percentage > 0 {
			percentageLabel.text = "\(--percentage)%"
		}
	}

	@IBAction func upPercentage(sender: AnyObject) {
		if percentage < 100 {
			percentageLabel.text = "\(++percentage)%"
		}
	}
}

